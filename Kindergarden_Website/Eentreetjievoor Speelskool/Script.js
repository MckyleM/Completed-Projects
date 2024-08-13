document.addEventListener('DOMContentLoaded', () => {
    const panels = document.querySelectorAll('.panel');
    const links = document.querySelectorAll('.Link');
    const logos = document.querySelectorAll('#Logo');
    


    // Rotate the logo on page load
    rotateLogo();

    links.forEach((link) => {
        link.addEventListener('click', (event) => {
            event.preventDefault();
            rotateLogo();
            removeActiveClassesLogo();
            const page = link.getAttribute('href');
            // Manually navigate to the new page
            window.location.href = page;
        });
    });

    panels.forEach((panel) => {
        panel.addEventListener('click', () => {
          removeActiveClassesPanels();
            panel.classList.add('active');
 

        });
    });
    function removeActiveClassesLogo() {
        logos.forEach((logo) => {
            logo.classList.remove('clicked');
        });
    }

    function removeActiveClassesPanels() {
        panels.forEach((panel) => {
            panel.classList.remove('active');
        });
    }
    

    function rotateLogo() {
        logos.forEach((logo) => {
            logo.classList.add('spin');
            setTimeout(() => {
                logo.classList.remove('spin');
            }, 5000); // 5000 milliseconds (5 seconds)
        });
    }
});

const openModalButtons = document.querySelectorAll('[data-modal-target]')
const  closeModalButtons = document.querySelectorAll('[data-close-button]')
const overlay = document.getElementById('overlay')

openModalButtons.forEach(button => {
    button.addEventListener('click',()=>{
        const modal = document.querySelector(button.dataset.modalTarget)
        openModal(modal)
    })
})
overlay.addEventListener('click',()=>{
    const Modals = document.querySelectorAll('.modal.active')
    Modals.forEach(modal => {
        closeModal(modal)
    })
})
closeModalButtons.forEach(button => {
    button.addEventListener('click',()=>{
        const modal = button.closest('.modal')
        closeModal(modal)
    })
})


function openModal(modal){
    if(modal==null) return
    modal.classList.add('active')
    overlay.classList.add('active')
}

function closeModal(modal){
    if(modal==null) return
    modal.classList.remove('active')
    overlay.classList.remove('active')
}