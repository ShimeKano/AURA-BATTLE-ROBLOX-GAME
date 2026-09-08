# Decision Log

This file records decisions that future contributors should not accidentally reverse.

## D001 — Aura is the central progression number
**Status:** accepted

Aura is the primary progression/status metric. It is not replaced by a collection of unrelated currencies without explicit design approval.

## D002 — Combat is real-time
**Status:** accepted

The game is an action PvP/PvE experience. Turn-based combat is outside the current direction.

## D003 — PvP is risky but not catastrophic
**Status:** accepted

PvP death removes a configured fraction of Aura; default is 10%. PvE death does not remove Aura. The intent is tension without making casual players afraid to play.

## D004 — Many-vs-one is intentional
**Status:** accepted

A large group of weak players must be capable of challenging a very strong player. Reward eligibility must prevent infinite farming abuse.

## D005 — Safe Zone is conditional
**Status:** accepted

Entering the Safe Zone does not instantly end combat. A player must survive 60 seconds without qualifying damage before safe healing is restored.

## D006 — High Aura creates vulnerability through attention
**Status:** accepted

Strong players should not simply be nerfed. Their weakness is intended to be visibility, bounty, and the ability of groups to hunt them.

## D007 — AFK is secondary progression
**Status:** accepted

AFK rewards exist for convenience/retention but should not normally outperform active gameplay.

## D008 — Admin events are part of the product vision
**Status:** accepted

Admin-driven gifts/events can create social moments and live content. They must remain secure and auditable.

## D009 — Scope before polish
**Status:** accepted

Prove the core loop before building large amounts of content, cosmetics, or advanced systems.

## How to add a decision

Use:

```text
## Dxxx — Short decision title
**Status:** proposed | accepted | superseded

Context:
...

Decision:
...

Reason:
...

Impact:
...
```
