# Project Charter

## Mission
Build a simple, replayable Roblox real-time PvE/PvP game in which **Aura is the central progression and status metric**.

## The promise to the player
> Get stronger. Take risks. Fight. Become a target.

## Non-negotiable pillars

### 1. Aura is the center
Aura is the main progression/status number. It is earned through PvE, AFK, shop purchases, events, and PvP rewards. It unlocks power such as HP, damage, and eventually skills.

### 2. Real-time combat
Combat is simultaneous and action-oriented. The project must not drift into a turn-based card/strategy system.

### 3. PvE enables PvP
NPC farming gives players a safe path to grow. Stronger NPC areas should offer better rewards and progression gates should eventually push players forward.

### 4. PvP has meaningful risk
Only PvP deaths remove Aura by default. The lost Aura becomes a reward pool distributed by contribution. PvP must feel risky without making normal progression brutally punishing.

### 5. Numbers do not make players invincible
High-Aura players should be stronger, but high power should attract attention, bounty, and coordinated attacks. A server boss must be possible to challenge.

### 6. Many-vs-one is a feature
Weak players can cooperate to defeat a powerful player. Contribution/reward systems must support large hunts while preventing infinite farming of one target.

### 7. Safe Zone is conditional safety
A player who is still in combat cannot use the Safe Zone to instantly heal or escape combat rules. After 60 seconds without damage, the player becomes safe and may regenerate.

### 8. Monetization must support the fantasy
Robux can accelerate progression, provide convenience, protection, Aura packs, and powerful consumables. Monetization must not make every non-paying player completely irrelevant.

### 9. Admins are content creators
Authorized admins can give Aura and trigger events. Admin powers must be server-side, permission-checked, validated, and auditable.

## Product priority
When there is a conflict, prioritize:

1. Fun core loop
2. Combat reliability
3. Progression clarity
4. Retention/replayability
5. Performance/security
6. Monetization
7. Cosmetic polish

Do not reverse this order just because a feature is easier to monetize.

## Anti-scope-creep rule
A proposal is not automatically good because it is fun, popular, or technically impressive. Before adding it, answer:

- Does it strengthen the core loop?
- Does it fit the fantasy?
- Can it be tested cheaply?
- Does it introduce a second competing progression loop?
- Does it belong in the current milestone?

If the answer is unclear, keep it out of the current implementation and record it as a proposal instead.
