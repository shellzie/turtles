$ ->
  if ($("#qrcode").length > 0)
    app_id = window.location.pathname.split("/")[2];
    new QRCode(document.getElementById("qrcode"), app_id)

  $(".shrink").hide()

  $(".enlarge").click ->
    $(this).hide()
    $(".shrink").show()
    $("#nod").css("height", "100%")
    $("#nod").css("width", "100%")

  $(".shrink").click ->
    $(this).hide()
    $(".enlarge").show()
    $("#nod").css("height", "248px")
    $("#nod").css("width", "248px")

  $(".print").click ->
    newWindow = window.open('/assets/nod.png')
    newWindow.print()

  $(".download").click ->
    link = document.createElement('a')
    link.href = '/assets/nod.png'
    link.download = 'Nod.png'
    document.body.appendChild(link)
    link.click()