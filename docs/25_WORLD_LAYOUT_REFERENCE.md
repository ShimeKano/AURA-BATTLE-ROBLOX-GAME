# AURA BATTLE — WORLD LAYOUT REFERENCE

## Master layout

```text
                              NORTH
                                ↑
                       ┌──────────────────┐
                       │    BOSS ARENA    │
                       │   World Boss     │
                       └────────┬─────────┘
                                │ Void Gate
                       ┌────────▼─────────┐
                       │  VOID TERRITORY  │
                       │                  │
                       │  Rare Camps      │
                       │  Void Landmark   │
                       │  Loot Routes     │
                       └──────┬─────┬─────┘
                              │       │
                     ┌────────▼─┐   ┌─▼──────────┐
                     │  RUINS   │   │ EVENT ZONE │
                     │ Elite NPC│   │ Reusable   │
                     └────┬─────┘   └────┬───────┘
                          │              │
                    ┌─────▼──────────────▼─────┐
                    │        WILDLANDS         │
                    │ NPC Camps / Open PvP     │
                    │ Bridges / Caves / Paths  │
                    └────────────┬─────────────┘
                                 │
                    ┌────────────▼─────────────┐
                    │     TRAINING GROUNDS     │
                    │ Dummies / Weak NPCs     │
                    └────────────┬─────────────┘
                                 │
              ┌──────────────────▼──────────────────┐
              │             SAFE HAVEN              │
              │                                     │
              │ Spawn      Shop      Skills         │
              │                                     │
              │ AFK Zone   Profile   Leaderboards   │
              │                                     │
              │       Training Portal               │
              └─────────────────────────────────────┘
                                ↓
                              SOUTH
```

## Navigation principles

- Safe Haven is the visual and gameplay anchor.
- Main progression should be understandable without a minimap.
- Every dangerous zone has at least one obvious route back.
- Side paths should reward exploration without making the main route confusing.
- Portals/gates should be landmarks, not random glowing pads.

## Safe Haven layout

```text
┌─────────────────────────────────────────┐
│               LEADERBOARDS              │
│                                         │
│  SHOP                 CENTRAL           │
│  NPC            SPAWN / PLAZA      SKILL│
│                                         │
│  PROFILE              AFK ZONE          │
│                                         │
│             TRAINING GATE               │
└─────────────────────────────────────────┘
```

The AFK Zone is the existing `Workspace["AFK-Zone"]` and must remain compatible with the existing AFK service design.

## Training Grounds layout

```text
             TRAINING GATE
                   │
       ┌───────────┼───────────┐
       │           │           │
   Dummy Yard   Weak Camp   Tutorial
       │           │           │
       └───────────┼───────────┘
                   │
              Wildlands Gate
```

## Wildlands layout

```text
                    RUINS PATH
                        │
              ┌─────────┴─────────┐
              │                   │
          Elite Camp          Cave Route
              │                   │
      Common Camp ────── Bridge ──┘
              │
        Training Route
```

The Wildlands should have enough alternate routes that players cannot predict every encounter.

## Ruins layout

```text
                   VOID GATE
                       │
              ┌────────┴────────┐
              │ Central Ruins   │
              │ landmark        │
              └───┬────────┬────┘
                  │        │
             Elite Camp   Hidden Room
                  │
             Wildlands Path
```

## Void Territory layout

```text
                         BOSS PORTAL
                              │
                     ┌────────▼────────┐
                     │  VOID LANDMARK  │
                     └──────┬─────┬────┘
                            │     │
                       Rare Camp  Loot Route
                            │     │
                         Ambush / PvP paths
                            │
                          RUINS
```

The Void Territory should feel like a place players deliberately choose to enter because the rewards justify the risk.

## Boss Arena layout

```text
                ENTRANCE / STAGING
                        │
                 ┌──────▼──────┐
                 │ PLAYER SPAWN│
                 └──────┬──────┘
                        │
              ┌─────────▼─────────┐
              │                   │
              │    BOSS ARENA     │
              │                   │
              │    BOSS SPAWN    │
              │                   │
              └───────────────────┘
```

Boss arena geometry must leave enough space for telegraphed attacks and movement mechanics.

## Event Zone

The Event Zone should be structurally generic:
- central combat area
- outer staging ring
- event spawn points
- event boundary
- reward presentation location
- optional spectator-safe area

Event logic should determine the rules; the map should provide reusable physical space.

## Landmark list

Recommended recognizable landmarks:
- Safe Haven central plaza.
- AFK sign/zone.
- Training gate.
- Wildlands bridge.
- Ruins tower.
- Void landmark.
- Boss portal.
- Event arena gate.

Landmarks help players navigate without constant UI guidance.

## Future expansion sockets

Leave conceptual space/hooks for:
- Snow/ice zone.
- Desert zone.
- Sky island.
- Underworld.
- Ocean/underwater zone.
- Ranked PvP arena.
- Guild area.
- Seasonal event islands.

Do not build these until the core game proves fun.
