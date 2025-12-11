# Basics

This engine is scripted in HScript, more specifically a fork of HScript called HScript-Iris. Before reading this guide, familiarize yourself with HScript and/or Haxe. It's nessesary to make games and won't be covered in this guide.

## File Structure
```
games/MYGAME/
    assets/
      data/
      images/
      sounds/
      music/
    states/ (State HScript files)
    substates/ (Substate HScript files)
    globals/ (HScript files ran in every state)
    scripts/ (HScript files callable with include())
    librarieis/ (Unimplemented)
    meta.json (Manifest file for games, contains metadata.)
```

## Global Functions

This goes over functions any HScript script can access.

`include(script:String)` - lets you access scripts from your `scripts/` folder.
