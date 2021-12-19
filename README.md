# CryptoTamers

## Fighting
### Stats
The stats are Speed, Strength and Buffness.
* Speed: Affects the order of evasiveness, higher speed means more chance of the foe missing the attack. 
* Strength: Affects damage, higher strength means you hit harder.
* Buffness: Affects defense, higher buffness means you take more hits and take less damage.

### Fighting
The monster fight is an idle minigame. There isnt much that the player can do but cheer for their monster at first. Futurely i intend to add some spot clicking and/or key pressing events to boost the stats or give more damage.

The monsters will battle each other and damage is calculated after the monster stats. 
* Damage = self.Strength - (enemy.buffness * 0,25)

There is a chance of the oponent missing the attack and it is calculated before doing damage.
* Chance of hitting: 
random from (self.speed*0,25)-(enemy.speed * 0,25) to (self.Speed - (enemy.speed * 0,25)) > random from (enemy.speed*0,25)-(self.speed * 0,25) to (enemy.Speed - (self.speed * 0,25))

### Prime Elements
Monster type affects damage delt and taken, the strengths and weakness of each type are described in the image bellow:

![Monster types table](https://i.imgur.com/qK2V65m.png "Monster types table")

At the moment each type avantage has a damage increase of 25% and each type weakness has a damage reduction 25%.

## Breeding
### Prime Elements
![Monster types table](https://i.imgur.com/beftJf9.png "Monster types table")

Tamed monsters are captured with a pure type, the pure types are water, ground and fire. By breeding diferent pure types you have a 50% chance to obtain new types being them: plant, metal, air and electricity. By breeding two pure monsters of diferent types you have 50% chance of the offspring being born with one of the parents type being then 60% of chance of being born with the father's type and 40% of the mother's type. By breeding two monsters of the inpure type or pure monsters of the same type the offspring will be born following the 60/40 rule.

### Body Type
<img src="https://i.imgur.com/Tgyyczo.png" width="100" /><img src="https://i.imgur.com/bZJ8xAY.png" width="100" /><img src="https://i.imgur.com/iElr5at.png" width="100" /><img src="https://i.imgur.com/Ocpcrhs.png" width="100" /><img src="https://i.imgur.com/GIe5ZYD.png" width="100" />

There are 5 body types, and they are: Beast, Bipedal, Serpant, Special and Spheroid. You can only breed two monsters that are in the same body type group.