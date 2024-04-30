const FULL_DASH_ARRAY = 283;
    const TIME_LIMIT = document.getElementById("fromJsp").innerHTML;
    
    let timePassed = 0;
    let timeLeft = TIME_LIMIT;
    let timerInterval = null;


    function startPauseTimer() {
        const controlButton = document.getElementById("controlButton");

        if (controlButton.innerText === "Start") {
            startTimer();
            controlButton.innerText = "Pause";
        } else if (controlButton.innerText === "Pause") {
            pauseTimer();
            controlButton.innerText = "Start";
        } else if (controlButton.innerText === "Restart") {
            restartTimer();
            controlButton.innerText = "Pause";
        }
    }

    function startTimer() {
        timerInterval = setInterval(() => {
            timePassed++;
            timeLeft = TIME_LIMIT - timePassed;
            updateTimer();
            setCircleDasharray();

            if (timeLeft === 0) {
                clearInterval(timerInterval);
                replaceButton();
            }
        }, 1000);
    }

    function pauseTimer() {
        clearInterval(timerInterval);
    }

    function restartTimer() {
        clearInterval(timerInterval);
        timePassed = 0;
        timeLeft = TIME_LIMIT;
        updateTimer();
        setCircleDasharray();
        startTimer();
    }

    function updateTimer() {
        document.getElementById("timer-text").innerText = timeLeft;
    }

    function setCircleDasharray() {
        const circleDasharray = `${((timeLeft / TIME_LIMIT) * FULL_DASH_ARRAY).toFixed(0)} 283`;
        document.getElementById("timer-progress").setAttribute("stroke-dasharray", circleDasharray);
    }

    function replaceButton() {
        const controlButton = document.getElementById("controlButton");
        controlButton.innerText = "Restart";
    }
