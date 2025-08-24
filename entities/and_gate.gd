extends Node
@export var activate_objects : Array[Node]

@export var amount : int = 2
var interact_counter = 0;
func interact():
	interact_counter+=1;
	if(interact_counter>=amount):
		for i in activate_objects:
				i.interact()
