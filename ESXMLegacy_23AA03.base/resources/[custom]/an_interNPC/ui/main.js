window.addEventListener('message', function(event) {
    if (event.data.action == 'play') {
        playSound(event.data.sound);
    }
})

function playSound(name) {
    var audio = document.getElementById("sfx");
    audio.src = "sounds/" + name + ".mp3";
    audio.volume = 0.75;
    audio.play();
}