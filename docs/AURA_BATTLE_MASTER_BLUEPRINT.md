# AURA BATTLE — MASTER BLUEPRINT

> Canonical high-level blueprint for the entire game. This document is intentionally implementation-oriented: it describes the product, world, systems, technical rules, AI workflow, and the order in which the game should be built.

## 1. Product identity

**AURA BATTLE** is a real-time Roblox PvE/PvP progression game built around one core resource: **Aura**.

Core fantasy:

`Spawn → farm NPCs → gain Aura → become stronger → unlock/equip skills → enter dangerous zones → fight players → earn/steal Aura → become a bigger target → survive and progress.`

The game must feel like an action RPG rather than a passive simulator. Combat must be readable, responsive, server-authoritative, and reward good decisions.

### Design pillars

1. Aura is the identity of progression.
2. Combat is fast but readable.
3. PvP is risky and rewarding, not random punishment.
4. Skills create meaningful builds and counterplay.
5. The server owns all valuable outcomes.
6. The world teaches danger through visual and mechanical progression.
7. Monetization must not make competitive victory a simple purchase.
8. Every system should be modular, testable, and replaceable.

## 2. Non-negotiable technical rules

- Roblox + Luau + Rojo + GitHub/Codespaces.
- GitHub/Rojo source code is the code source of truth.
- Roblox Studio is the primary environment for map construction, visual assets, testing, and Studio-only Data Model work.
- Use a server-authoritative architecture.
- Client sends intent; server validates and decides outcomes.
- Never trust client Aura, damage, kills, rewards, inventory, cooldown completion, or purchase grants.
- Reuse existing services instead of creating duplicate systems.
- Centralize balance values in shared configuration.
- Do not silently rewrite unrelated systems.
- Keep implementation in small coherent tasks.
- Before changing code, inspect the existing repository and current Data Model.
- After each task, test the smallest relevant surface before starting the next task.

## 3. Starting progression

- Starting Aura: **10**.
- Aura is earned from PvE, PvP, AFK, bosses, events, quests and controlled rewards.
- Aura can be spent on skills, upgrades, cosmetics and selected utility.
- Recommended internal model:
  - `SafeAura`: protected long-term progression.
  - `RiskAura`: portion exposed to PvP risk.
- Do not make death erase a player's entire lifetime progression.

## 4. World / map master plan

The map should be one connected progression path with optional side routes.

```text
                         ┌───────────────────┐
                         │    BOSS ARENA     │
                         │  World Boss Gate  │
                         └─────────┬─────────┘
                                   │
                         ┌─────────▼─────────┐
                         │  VOID TERRITORY   │
                         │ high risk / loot  │
                         └──────┬───────┬────┘
                                │       │
                         ┌──────▼─┐ ┌──▼────────┐
                         │ RUINS  │ │EVENT ZONE │
                         │ elites │ │ temporary  │
                         └────┬───┘ └────┬──────┘
                              │           │
                       ┌──────▼───────────▼──────┐
                       │       WILDLANDS         │
                       │ common/elite NPC camps  │
                       │ open PvP begins         │
                       └────────────┬────────────┘
                                    │
                       ┌────────────▼────────────┐
                       │     TRAINING GROUNDS    │
                       │ tutorial / weak NPCs    │
                       └────────────┬────────────┘
                                    │
                  ┌─────────────────▼─────────────────┐
                  │            SAFE HAVEN             │
                  │ Spawn • Shop • Skills • Profile  │
                  │ AFK • Leaderboards • Portals     │
                  └───────────────────────────────────┘
```

### 4.1 Safe Haven

Purpose: spawn, orientation, social hub, preparation.

Required landmarks:
- Main Spawn.
- Welcome/tutorial sign.
- Aura Shop.
- Skill Shop / Skill NPC.
- Profile/Stats terminal.
- Leaderboard wall or displays.
- AFK Zone using the existing `Workspace["AFK-Zone"].GreenPart`.
- Portal/gate toward Training Grounds.
- Optional event board.

Rules:
- PvP disabled.
- Aura protected.
- Spawn protection enabled for a short duration.
- Combat lock must prevent abuse of the safe zone immediately after attacking or being attacked.

Visual identity: bright, safe, readable, clean architecture; this is the visual contrast against later dangerous zones.

### 4.2 Training Grounds

Purpose: teach movement, combat and first progression.

Required:
- Training dummies.
- Weak NPC camps.
- Small obstacle route.
- Combat tutorial signs.
- First skill demonstration area.
- Return gate to Safe Haven.

PvP: disabled or strongly restricted for the initial version.

### 4.3 Wildlands

Purpose: first real farming zone and first meaningful open PvP environment.

Required:
- Multiple NPC camps separated enough to avoid one optimal farm route.
- Terrain variation.
- Small caves/ruins/bridges.
- Resource/loot points where appropriate.
- Several routes toward Ruins.
- Clear visual increase in danger.

NPC tiers: Weak, Common, Elite.

PvP: enabled outside clearly marked protected pockets.

### 4.4 Ruins

Purpose: elite PvE and higher-risk PvP.

Required:
- Broken structures.
- Elite camps.
- Vertical routes.
- Hidden room or side path.
- Stronger atmosphere and hazards.
- Gate/portal toward Void Territory.

PvP: enabled.

### 4.5 Void Territory

Purpose: endgame-risk farming and rare rewards.

Required:
- Large central landmark.
- Dangerous traversal.
- Rare NPCs.
- Elite/mini-boss camps.
- Rare loot locations.
- Multiple ambush routes.
- Void portal toward Boss Arena.
- Event hooks.

PvP: fully enabled except explicitly protected event infrastructure.

Visual identity: dark/otherworldly, high contrast, strong VFX/audio cues.

### 4.6 Boss Arena

Purpose: cooperative/competitive world-boss encounter.

Required:
- Entrance gate.
- Large circular/structured arena.
- Boss spawn point.
- Phase/telegraph space.
- Player spawn/return point outside boss hit area.
- Contribution tracking hook.
- Reward presentation area.

Boss mechanics must be readable. Avoid giant invisible hitboxes or unavoidable damage.

### 4.7 Event Zone

An event zone can be a reusable arena or temporary world area for:
- Aura Storm.
- Massacre.
- Void Rift.
- Boss Invasion.
- Hunter Hunt.
- Double Aura.
- Server Bounty.
- Emergency Evacuation.

The map should support events without requiring the entire world to be rebuilt.

### 4.8 Hidden areas

Reserve hooks for:
- Secret cave.
- Hidden boss.
- Developer/achievement room.
- Rare skill discovery.
- Lore collectible.

Hidden content must not break the main progression path.

## 5. World construction specification

When building in Roblox Studio, use stable names and predictable hierarchy.

Recommended hierarchy:

```text
Workspace
├── World
│   ├── SafeHaven
│   │   ├── Spawn
│   │   ├── Shop
│   │   ├── SkillShop
│   │   ├── Leaderboards
│   │   ├── Portals
│   │   └── Decorations
│   ├── TrainingGrounds
│   │   ├── NPCSpawns
│   │   ├── TrainingDummies
│   │   └── Decorations
│   ├── Wildlands
│   │   ├── NPCSpawns
│   │   ├── PvPBoundaries
│   │   ├── Loot
│   │   └── Decorations
│   ├── Ruins
│   │   ├── NPCSpawns
│   │   ├── Hazards
│   │   └── Decorations
│   ├── VoidTerritory
│   │   ├── NPCSpawns
│   │   ├── Loot
│   │   ├── PvPBoundaries
│   │   └── Decorations
│   ├── BossArena
│   │   ├── BossSpawn
│   │   ├── PlayerSpawns
│   │   ├── Boundaries
│   │   └── Decorations
│   └── EventZone
│       ├── Spawn
│       ├── Boundaries
│       └── Decorations
└── [existing AFK-Zone]
```

Use Attributes/CollectionService tags where practical:
- `ZoneId`
- `SafeZone`
- `PvPEnabled`
- `NPCSpawn`
- `TeleportPoint`
- `LootPoint`
- `EventArena`

Do not make every decorative part a physics-heavy object. Prefer anchored, simple geometry, sensible collision groups, StreamingEnabled and cleanup of temporary effects.

## 6. Combat

Initial combat kit:
- Basic/light attack.
- Heavy/charged attack.
- Block.
- Dodge/dash.
- Three active skills.
- One ultimate.

Combat states:
`Idle, Attacking, Blocking, Dodging, Stunned, Knocked, Dead, Invulnerable, SafeZone, PvPDisabled, Casting`.

Conceptual damage formula:

`FinalDamage = BaseDamage × AttackScaling × SkillMultiplier × Modifiers`

Server validates:
- attacker state
- target validity
- distance
- line of sight where required
- cooldown
- resource cost
- rate limits
- PvP/PvE state
- safe-zone state

## 7. Skills

Rarities:
`Common, Uncommon, Rare, Epic, Legendary, Mythic, Event`.

Categories:
`Melee, Ranged, Mobility, Defense, CC, Buff, Debuff, Summon, AoE, Execute, Ultimate`.

Default loadout:
- 3 active skills.
- 1 mobility slot.
- 1 ultimate.
- Basic attack always available.

Every strong skill needs counterplay. Rarity must not simply mean impossible-to-beat power.

Skill data should include:
- ID/name/description.
- Rarity/category.
- Aura/Robux acquisition.
- Unlock requirement.
- PvE/PvP multipliers.
- Cooldown/resource/cast time.
- Range/hitbox/duration.
- Damage/knockback/status effects.
- Animation/VFX/SFX/icon.
- Counterplay.

## 8. NPC/PvE

NPC tiers:
`Training Dummy, Weak, Common, Elite, Mini Boss, World Boss`.

AI states:
`Idle, Patrol, Detect, Chase, Attack, Recover, Search, Return, Dead, Respawn`.

Difficulty should come from mechanics and readable patterns, not only inflated HP.

World bosses should have phases, telegraphed attacks, contribution tracking, reward tables and an enrage timer.

## 9. PvP

States:
`Safe, PvPEnabled, InCombat, CombatLock, ProtectedSpawn, EventPvP`.

Outside protected zones, PvP can be open-world.

Death flow:
1. Determine valid attackers.
2. Calculate contribution.
3. Apply anti-farm rules.
4. Calculate reward.
5. Transfer/create reward.
6. Record kill/death.
7. Notify both sides.

Conceptual reward:

`Reward = VictimRiskAura × RewardRate × ContributionModifier × AntiFarmModifier × EventModifier`

Repeated farming of the same player must have diminishing/no rewards.

## 10. Aura economy

Initial illustrative rewards:
- Training NPC: 1–5.
- Weak NPC: 3–10.
- Common NPC: 8–20.
- Elite NPC: 20–60.
- Mini Boss: 75–250.
- World Boss: 250+.

Initial skill price targets:
- Common: 50–250 Aura.
- Uncommon: 200–750.
- Rare: 500–2,000.
- Epic: 1,500–5,000.
- Legendary: 5,000–20,000.
- Mythic: special/event pricing.

Target: first meaningful skill within roughly 5–15 minutes for a new player.

Existing AFK system target:
- Existing `Workspace["AFK-Zone"].GreenPart` is the trigger.
- Enter = AFK.
- While inside = +5 Aura every 10 seconds.
- Leave = stop reward.
- Server-authoritative.
- Config should contain:

```lua
AFK = {
    Reward = 5,
    Interval = 10,
}
```

Do not replace the existing AFK map object merely to implement the service.

## 11. UI/UX

Main HUD:
- Top-left: name/avatar/health/energy/status.
- Top-center: Aura/streak/bounty/event banner.
- Bottom-center: attack + skill slots + mobility + ultimate.
- Center: hit/combat feedback.
- Right: target/boss/event information.

Menus:
- Profile.
- Skills.
- Shop.
- Settings.

Support desktop, mobile and controller. Add reduced-motion/flash settings and scalable UI where practical.

## 12. Feedback / presentation

Every meaningful action should have at least one readable feedback layer.

Aura gain:
- particle/glow
- +Aura number
- reward sound

Combat:
- animation
- impact VFX
- SFX
- damage/reaction
- optional camera feedback

Use pooling/cleanup and particle limits. Do not create thousands of permanent emitters.

## 13. Social / leaderboard

Leaderboard candidates:
- Aura.
- Kills.
- Kill streak.
- Bounty.
- Boss contribution.
- Seasonal score.

Public profiles can show:
- build
- titles
- achievements
- selected statistics

Parties, guilds, duels and trading are future systems unless explicitly promoted into the active roadmap.

## 14. Events / endgame

Core event candidates:
- Aura Storm.
- Boss Invasion.
- Massacre.
- Void Rift.
- Double Aura.
- Hunter Hunt.
- Server Bounty.
- Emergency Evacuation.

Endgame:
- skill mastery
- rare skills
- prestige
- PvP rank
- boss records
- seasonal leaderboard
- cosmetics/titles

## 15. Data architecture

Server-owned data should eventually include:

```lua
{
    Version = 1,
    Aura = 10,
    Inventory = {},
    Skills = {},
    EquippedSkills = {},
    Stats = {},
    Titles = {},
    Settings = {},
}
```

Current DataStore key target:
`AURA_BATTLE_PlayerData_v1`

Save on PlayerRemoving, BindToClose and controlled checkpoints. Never overwrite healthy persistent data with a failed/partial load result.

## 16. Security / anti-exploit

Never trust client values for:
- Aura.
- Damage.
- Target selection outcome.
- Kill rewards.
- Skill cooldown completion.
- Inventory.
- Purchases.
- Admin permissions.

Remotes should represent intent, e.g. `RequestAttack`, not `GiveDamage`.

Sensitive remotes require rate limits and validation.

## 17. Admin / live ops

Roles:
`Player, Moderator, Manager, Admin, Owner`.

Admin actions:
- inspect player
- grant/remove Aura
- kick/ban
- teleport
- spawn NPC
- start event
- announce
- inspect logs

Dangerous actions require confirmation and should be auditable.

## 18. Monetization

Preferred model:
- cosmetics
- convenience
- extra loadout flexibility
- optional skill acquisition
- events

Avoid direct guaranteed competitive dominance.

Purchase flow:
`Preview → Confirm → Server verifies entitlement → Grant → Persist → UI update`.

## 19. Performance

Target a stable multiplayer experience.

Rules:
- StreamingEnabled for large worlds.
- Avoid excessive physics.
- Prefer anchored static geometry.
- Clean temporary VFX/SFX.
- Pool frequently spawned effects.
- Avoid per-frame loops unless necessary.
- Prefer event-driven logic.
- Keep NPC AI updates bounded.
- Profile before optimizing blindly.

## 20. Development phases

### Phase 0 — Foundation
Rojo, project structure, config, PlayerDataService, AuraService, ServerMain, remotes.

### Phase 1 — AFK
Existing AFK zone + AFKService + Aura reward + tests.

### Phase 2 — World blockout
Safe Haven, Training Grounds, Wildlands, Ruins, Void Territory, Boss Arena, portals and zone boundaries.

### Phase 3 — PvE
NPC framework, spawn manager, AI, rewards, respawn.

### Phase 4 — Combat
Basic attack, heavy, block, dodge, damage validation, states.

### Phase 5 — Skills
Skill registry, loadout, cooldowns, server validation, first 3–5 skills.

### Phase 6 — PvP
PvP states, combat lock, contribution, Aura risk/reward, anti-farm.

### Phase 7 — UI
HUD, target UI, skills UI, Aura feedback, menus.

### Phase 8 — World polish
Landmarks, lighting, VFX, audio zones, optimization, hidden areas.

### Phase 9 — Social
Leaderboards, profile, titles.

### Phase 10 — Events
World boss, Aura Storm, Massacre, Void Rift and event infrastructure.

### Phase 11 — Monetization
Passes/products/cosmetics with server verification.

### Phase 12 — Beta/launch
QA, exploit testing, performance, onboarding, analytics, balancing.

## 21. Definition of done for a task

A task is not done merely because the code exists.

A task is done when:
1. Relevant files are implemented.
2. No unrelated files were rewritten.
3. Luau syntax/structure is valid.
4. The feature works in Studio playtest where applicable.
5. Server authority is preserved.
6. Important edge cases are handled.
7. Existing behavior still works.
8. Documentation is updated if behavior changed.
9. The diff is reviewed.
10. The task can be explained in one short paragraph.

## 22. What NOT to do

- Do not implement every system in one giant operation.
- Do not create duplicate Aura/Data/Combat services.
- Do not move source-of-truth logic into LocalScripts.
- Do not trust RemoteEvent arguments blindly.
- Do not replace the map simply because a decorative solution is easier.
- Do not add monetization before the core loop works.
- Do not add dozens of skills before the first skills are fun and balanced.
- Do not generate enormous scripts that combine unrelated systems.
- Do not silently change project architecture.

## 23. Current implementation context

The repository already has a Rojo foundation and an existing AFK zone. The current development branch is `feature/rojo-foundation`.

The existing AFK zone contains:
- `Workspace["AFK-Zone"]`
- `GreenPart` as the intended trigger.
- `Sign` and border parts for the existing visual zone.

Preserve that setup unless a task explicitly changes it.

## 24. AI operating rule

The full blueprint is context, not a request to build everything immediately.

The correct behavior is:

**Inspect → plan → split into tasks → implement one task → test → inspect diff → commit → continue.**

If the task is too large, split it again.

A task should normally fit into one focused implementation session and have one obvious success condition.
