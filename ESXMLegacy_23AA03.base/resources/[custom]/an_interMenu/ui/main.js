let shown = false
let added = false

window.addEventListener('message', function(event) {

	if (event.data.action == 'show') {

	} else if (event.data.action == 'update') {
        if (event.data.visible) {
            shown = true
            let actions = event.data.actions
            if (!added) {
                actions.forEach(function (e, i) {
                    $( `
                    <div id="option-wrapper-${i}" class="option-wrapper">
                        <div id="option-${i}" class="option">
                            <div class="control" id="control-${i}">${e.key}</div>
                        </div>
                        <div class="label" id="label-${i}">${e.label}</div>
                    </div>
                    `
                    ).appendTo('#dev');
                });
                added = true;
            }
            $('#dev').fadeIn(300);
            $('#dev').css("top", event.data.top - 100);
            $('#dev').css("left", event.data.left + 300);
            $('#dev').css("scale", event.data.scale);
        } else {
            if (shown) {
                $('#dev').fadeOut(300);
                $("#dev").empty();
                shown = false
                added = false;
            }
        }
    } else if (event.data.action == 'hide') {
        $('#dev').fadeOut(300);
        $("#dev").empty();
        shown = false
        added = false;
	} else if (event.data.action == 'onkey') {
        let index = event.data.id - 1
        if (event.data.success) {
            playSound("selectsfx");
            $(`#option-wrapper-${index}`).addClass("animate__animated");
            $(`#option-wrapper-${index}`).addClass("animate__pulse");
            $(`#option-wrapper-${index}`).css('opacity', '100%');
            $(`#option-wrapper-${index}`).on('animationend', () => {
                $(`#option-wrapper-${index}`).removeClass("animate__animated");
                $(`#option-wrapper-${index}`).removeClass("animate__pulse");
                $(`#option-wrapper-${index}`).css('opacity', '');
            });
        } else {
            playSound("failedsfx");
            $(`#option-wrapper-${index}`).addClass("animate__animated");
            $(`#option-wrapper-${index}`).addClass("animate__headShake");
            $(`#option-wrapper-${index}`).css('opacity', '60%');
            $(`#option-wrapper-${index}`).on('animationend', () => {
                $(`#option-wrapper-${index}`).removeClass("animate__animated");
                $(`#option-wrapper-${index}`).removeClass("animate__headShake");
                $(`#option-wrapper-${index}`).css('opacity', '');
            });
        }
    }

})

function playSound(name) {
    var audio = document.getElementById(name);
    audio.volume = 0.32;
    audio.play();
}