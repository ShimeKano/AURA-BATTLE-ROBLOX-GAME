# Gameplay Rules — Authoritative Reference

## Player defaults

- Starting Aura: **10**.
- New players spawn in the Safe Zone.
- Basic attack is the default combat method for v0.1 if skills are not ready.

## Aura sources

1. NPC kills / PvE.
2. AFK zone passive generation.
3. Shop purchases.
4. Admin gifts.
5. Events.
6. PvP reward pools.

## NPC progression

NPC tiers increase in reward. A lower-tier NPC should stop being a meaningful Aura source after its configured progression cap. The exact values live in configuration.

## PvP Aura loss

- Aura is lost only when killed by another player in valid PvP.
- Default design value: **10% of current Aura**, subject to a configured minimum/floor.
- NPC deaths do not remove Aura.
- Lost Aura becomes the PvP reward pool.
- Reward is distributed according to valid damage contribution.

### Example
Victim has 2,000 Aura.

```text
PvP loss = 200 Aura
Victim remains = 1,800 Aura
Reward pool = 200 Aura
```

If attacker A dealt 25% of valid damage, A receives 25% of the reward pool, subject to configured rounding/minimum rules.

## Many-vs-one

Any number of players may contribute damage to a target. A low-Aura player is allowed to participate in a hunt against a high-Aura player.

The reward system must prevent repeatedly killing the same target with the same attackers from becoming an infinite Aura-generation exploit. Target reward eligibility/contribution history must therefore be tracked.

When an attacker is no longer reward-eligible for a target, that player may still participate in combat, but receives no additional reward from that target until eligibility is restored according to the configured rules.

## Combat state

Default combat timeout: **60 seconds since the most recent qualifying damage event**.

While in combat:
- no Safe Zone healing;
- Safe Zone does not immediately clear combat;
- the player remains attackable under valid PvP rules.

After 60 seconds without qualifying damage:
- combat ends;
- player becomes safe;
- normal Safe Zone regeneration may begin.

## Safe Zone

Safe Zone contains spawn, shop, upgrades, and AFK access.

Safe Zone is conditional safety, not an instant escape from combat.

## Progression

Aura can unlock:
- maximum HP;
- damage;
- skills when the skill system is implemented.

Exact thresholds must live in configuration.

## High-Aura weakness

High-Aura players are intentionally stronger but should become increasingly visible/valuable targets. A future threat/bounty system may expose high-Aura players to the server.

This is a design pillar, not permission to make high-Aura players arbitrarily weak.

## AFK

AFK provides passive Aura. It should normally be weaker than active progression. AFK level upgrades increase passive generation.

## Monetization

Possible products:
- 2×–5× Aura multipliers;
- Aura packs;
- temporary protection;
- emergency teleport;
- limited powerful consumables such as Massacre.

Products must be server-validated and use Roblox purchase/entitlement APIs correctly.

## Admin

Authorized admins may:
- give Aura;
- set Aura for testing/administration;
- spawn bosses;
- trigger events.

Admin actions must be permission-checked, validated, and auditable.
