-- this gets called starts when the level loads.
function start(song) -- arguments, the song name
    loadCharacter("MrBeast", 100, 100)
    loadCharacter("bfeli", 770, 450, true)
    loadCharacter("bfmateo", 770, 450, true)
    loadCharacter("bfdoggy", 770, 450, true)
    loadCharacter("bfbenjamin", 770, 450, true)
    changeNoteStyle("normal",2)
    changeNoteStyle("DoggyNotes",1)
end

-- this gets called every frame
function update(elapsed) -- arguments, how long it took to complete a frame

end

-- this gets called every beat
function beatHit(beat) -- arguments, the current beat of the song

end

-- this gets called every step
function stepHit(step) -- arguments, the current step of the song (4 steps are in a beat)

end