const panels = document.querySelectorAll('.panel')
const links = document.querySelectorAll('.Link')
const logo =  document.querySelectorAll('#Logo')

links.forEach((link)=>
{
    
    link.addEventListener('click',()=>{
      
        logo.classList.add('clicked')  
        removeActiveClassesLogo()
    })
}
)

panels.forEach((panel) =>
{
 panel.addEventListener('click',()=>{
    removeActiveClassesPanels()
    panel.classList.add('active')
 })
})
function removeActiveClassesLogo()
{
    logo.forEach(logos=>
    {
        logos.classList.remove('clicked')
    })
}
function removeActiveClassesPanels()
{
    panels.forEach(panel=>
    {
        panel.classList.remove('active')
    })
}