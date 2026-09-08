# Roadmap & Scope Control

## Current milestone: v0.1 vertical slice

The only goal of v0.1 is to prove the core loop:

`Spawn → 10 Aura → fight NPC → gain Aura → become stronger → enter PvP → fight → death → Aura loss/reward → recover → repeat.`

### Required for v0.1

- [ ] project structure and configuration
- [ ] player initialization
- [ ] DataStore persistence with safe retries
- [ ] AuraService
- [ ] NPC spawning/stats/death/reward
- [ ] basic real-time attack
- [ ] HP/damage progression
- [ ] player-vs-player combat
- [ ] PvP Aura loss
- [ ] damage contribution and reward pool
- [ ] multi-attacker support
- [ ] target reward anti-farm rules
- [ ] 60-second combat state
- [ ] conditional Safe Zone
- [ ] basic leaderboard/HUD
- [ ] basic map with low/mid/high PvE areas and PvP
- [ ] basic AFK zone

### Optional only if the core is already stable

- [ ] one simple skill
- [ ] basic shop shell
- [ ] one admin give-Aura command

## v0.2 — retention and content

Only start after v0.1 playtesting demonstrates the core loop is worth continuing.

Potential work:
- multiple NPC tiers;
- additional PvP areas;
- more progression milestones;
- basic skills;
- AFK upgrades;
- shop products;
- first admin event;
- stronger feedback/VFX.

## v0.3 — social PvP

Potential work:
- threat/bounty system;
- server boss designation;
- world boss;
- group-hunt feedback;
- better contribution UI;
- event system expansion.

## v1.0 candidates

- robust skills/combat;
- clans/parties;
- trading if justified;
- broader content;
- polished monetization;
- creator/admin live events;
- performance optimization;
- analytics-driven balance.

## Explicitly deferred

Do not build these before the core loop is validated unless the project owner explicitly approves:

- huge collections of Aura types;
- 10+ maps;
- complex clans;
- trading economy;
- elaborate character customization;
- cinematic campaigns;
- card/turn-based combat;
- unrelated simulator systems;
- large amounts of speculative content.

## Kill criteria

The project should be reconsidered if repeated playtests show that players do not:

- understand how to gain Aura;
- care about becoming stronger;
- voluntarily enter PvP;
- enjoy hunting or escaping other players;
- return after a first session.

Do not solve weak retention by blindly adding content. Diagnose the loop first.

## Scale criteria

Continue investment when testing shows evidence of:

- players returning;
- repeated PvP encounters;
- group hunts;
- meaningful progression sessions;
- players talking about or sharing high-Aura moments;
- sustainable server performance;
- monetization that does not destroy participation.

Numbers should be recorded in a future analytics document rather than guessed permanently in this file.
