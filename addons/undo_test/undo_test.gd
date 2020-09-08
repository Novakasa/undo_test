tool
extends EditorPlugin

func _input(event):
	var just_pressed = event.is_pressed() and not event.is_echo()
	
	if Input.is_key_pressed(KEY_F12) and just_pressed:
		test_action()
		return true

func test_action():
	var undo = get_undo_redo()
	
	undo.create_action("test action")
	
	var action_ref = ActionRef.new()
	var action_plugin = ActionPlugin.new()
	
	undo.add_do_method(action_ref, "output", "do method in ActionRef")
	undo.add_do_method(action_plugin, "output", "do method in ActionPlugin")
	undo.add_undo_method(action_ref, "output", "UNDO method in ActionRef")
	undo.add_undo_method(action_plugin, "output", "UNDO method in ActionPlugin")
	
	undo.commit_action()
	
