# Eggplant50

We're trying to pack a bunch of games together!

# Theme

* 🍆 With Jamuary on the horizon let's decide on a theme! Here are 5 to choose from:
* 🎆 Maximizing Minimalism
* 🏗️ Constructing Your Dreams
* 🔮 Cheating Depth
* 📐 Finding Poetry in Geometry
* 🗿 The Design of Spelunky

This is for the UFO 50 fan jam or Jamuary as @docky (Hayden Scott-Baron) has so
aptly dubbed it. Voting on multiple themes is kosher 👍 Let's conclude the
voting next Saturday (Saturday 6th 2024) which should give everyone a chance to
vote and then a few week or so to ponder before jamming begins in earnest ⌨️ 🧠


# Adding your game

1. Clone this repo as a template so you can create your game in Godot 3.5 with this project as your base.
2. Create your game in res://games/your-name-here That way all our games are isolated, so it should be easier to merge them back together.
3. Create a GameDef as res://games/your-name-here/game_yourname.tres
4. Add your GameDef to res://games/eggplant_games.tres

Once the jam is done, we can merge all the different projects, re-add
everyone's GameDef to res://games/eggplant_games.tres, and hopefully the package will
all work!


## Inputs

Use the `move_` inputs for movement:

	# Using get_vector will have a circular deadzone.
	var move := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	print(move.x, move.y)

	# Using get_axis will have a cross deadzone.
	var move_x := Input.get_axis("move_left", "move_right")
	var move_y := Input.get_axis("move_up", "move_down")

Use `Input1` and `Input2` for actions:

	var jumped = Input.is_action_just_pressed("Input1")
	var grabbing = Input.is_action_pressed("Input2")
