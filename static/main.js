const login = () => {
    const btn = document.getElementById("logWrap")
    const close = document.getElementById("close")
    btn.style.top = "46%"
    btn.addEventListener("wheel", function(e) {
        e.preventDefault()
        e.stopPropagation()
        return false
    })
    close.addEventListener("click", function() {
        btn.style.top = "-60%"
    })
}


const detailPopup = () => {
    const pop = document.getElementById("detailCard")
    const printBtn = document.getElementById("printBtn")
    const fcBtn = document.getElementById("fcBtn")
    const cbBtn = document.getElementById("cbBtn")
    const title = document.getElementById("titleDetailJasa")
    const imgSlide1 = document.getElementById("imgSlide1")
    const imgSlide2 = document.getElementById("imgSlide2")
    const imgSlide3 = document.getElementById("imgSlide3")
    const p1 = document.getElementById("textP1")
    const p2 = document.getElementById("textP2")
    const p3 = document.getElementById("textP3")
    const closeBtn = document.getElementById("closePopDetailBtn")
    pop.style.visibility = "visible"
    pop.style.top = "50%"

    // function (view)
    const view = (titleText, imgSrc1, imgSrc2, imgSrc3, pText1, pText2, pText3) => {
        // pop.style.visibility = "visible"
        // pop.style.top = "50%"
        title.innerHTML = titleText
        imgSlide1.src = imgSrc1
        imgSlide2.src = imgSrc2
        imgSlide3.src = imgSrc3
        p1.innerHTML = pText1
        p2.innerHTML = pText2
        p3.innerHTML = pText3
    }

    // printBtn.addEventListener("click", view("Jasa Printing"))

    closeBtn.addEventListener("click", function() {
        pop.style.top = "-50%"
        pop.style.visibility = "hidden"
            // setTimeout(function(){
            //     location.reload()
            // }, 1000)
    })
}


const editStock = () =>{
    document.addEventListener('click', function(e) {
        if (e.target.classList.contains('edit-stock')) {
            location.href = "#editStock"
            const td = e.target.parentElement
            const jumlah = td.previousElementSibling.previousElementSibling
            const harga = jumlah.previousElementSibling
            const nama = harga.previousElementSibling
            const kode = nama.previousElementSibling
            const id = kode.previousElementSibling
    
            const formEdit = document.getElementById('form-edit')
            formEdit.querySelector('#id').value = id.textContent
            formEdit.querySelector('#kode').value = kode.textContent
            formEdit.querySelector('#nama').value = nama.textContent
            formEdit.querySelector('#harga').value = harga.textContent.split(' ')[1]
            formEdit.querySelector('#jumlah').value = jumlah.textContent
        }
    })
}
editStock()

const editRecap = () =>{
    document.addEventListener('click', function(e) {
        if (e.target.classList.contains('editRecap')) {
            location.href = "#editRecapData"
            const td = e.target.parentElement
            const jumlah = td.previousElementSibling.previousElementSibling
            const harga = jumlah.previousElementSibling
            const nama = harga.previousElementSibling
            const kode = nama.previousElementSibling
            const id = kode.previousElementSibling
    
            const formEdit = document.getElementById('form-edit-recap')
            formEdit.querySelector('#id').value = id.textContent
            formEdit.querySelector('#kodeRecap').value = kode.textContent
            formEdit.querySelector('#namaRecap').value = nama.textContent
            formEdit.querySelector('#hargaRecap').value = harga.textContent.split(' ')[1]
            formEdit.querySelector('#jumlahRecap').value = jumlah.textContent
        }
    })
}
editRecap()


$(document).ready(function() {
    try {
      // Inisialisasi offcanvas
      $('.offcanvas').offcanvas({
        autohide: true
      });

      // Tambahkan event handler untuk menutup offcanvas
      // ketika link di dalamnya diklik
      $('.offcanvas a').click(function() {
        $('.offcanvas').offcanvas('hide');
      });
      $('.offcanvas .nav-item .login-icon-dropdown').click(function() {
        $('.offcanvas').offcanvas('hide');
      });
      $('.offcanvas .nav-item.dropdown').click(function() {
        $('.offcanvas').offcanvas('show');
      });
      

      $('.offcanvas a[href^="#"]').click(function(event) {
        // Nonaktifkan default behavior dari event click
        event.preventDefault();
      
        // Dapatkan elemen yang dituju oleh link
        var target = $(this).attr('href');
        var $target = $(target);
      
        // Scroll ke elemen yang dituju
        $('html, body').animate({
          scrollTop: $target.offset().top
        }, 10);
      });
    } catch (error) {
      // Tangani error yang terjadi
      console.error(error);
    }
  });