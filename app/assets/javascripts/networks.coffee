$ ->
  $(".timer").hide()

  if ($("#network-info").length > 0)
    nw_info = document.getElementById('network-info');
    name = nw_info.dataset.name
    password = nw_info.dataset.password
    turtle_id = nw_info.dataset.turtleId
    counter = 1
    pollingPtr = null
    countdownPtr = null
    timerPeriod = 120 # number of seconds that countdown uses. 120 seconds or 120000 ms
    timerPeriodCtr = timerPeriod # define new variable because it's state will be changed inside loop
    pollInterval = 10000 #query DB every 10 secs

  if ($(".networks-container #qrcode").length > 0)
    new QRCode(document.getElementById("qrcode"), {text:"connect:ti="+turtle_id+"&nm="+name+"&pw="+password, width:"500", height:"500"})
#    new QRCode(document.getElementById("qrcode"), {text:"http://bit.ly/1XPgXKj"})

  $(".start").on 'click', (event) =>
    pollingPrep()

  $("#retry").on 'click', (event) =>
    pollingPrep()

  retryText = ->
    $(".timer").hide()
    $(".result").html("<div>Could not connect</div>")
    $(".start").text("Retry").show()

  pollingPrep = ->
    $(".start").hide()
    $(".timer").show()
    startPolling()
    startCountdown()

  doPolling = ->
    if counter > ((timerPeriod*1000) / pollInterval)
      stopAll()
      retryText()
    else
      counter++
      $.ajax '/connect_result?turtle_id='+turtle_id,
        type: 'GET'
        dataType: 'html'
        error: (jqXHR, textStatus, errorThrown) ->
        success: (data, textStatus, jqXHR) ->
          stopAll()
          $(".timer").hide()
          $(".result").html("<div>Connected Successfully</div><div><a class='btn btn-primary' href='/' role='button'>Continue</a></div>")

  startPolling = ->
    pollingPtr = setInterval(doPolling, pollInterval)  #call doPolling every 10 secs

  stopPolling = ->
    clearInterval(pollingPtr)

  startCountdown = ->
    countdownPtr = setInterval(doCalc, 1000)

  stopCountdown = ->
    clearInterval(countdownPtr)

  doCalc = ->
    minutes = parseInt(timerPeriodCtr / 60, 10)
    seconds = parseInt(timerPeriodCtr % 60, 10)
    minutes = if (minutes < 10) then ("0" + minutes) else minutes
    seconds = if (seconds < 10) then ("0" + seconds) else seconds
    $(".timer").text(minutes + ":" + seconds)
    if (--timerPeriodCtr < 0)
      stopAll()
      retryText()

  stopAll = ->
    stopCountdown()
    stopPolling()