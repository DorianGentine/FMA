
function createWebhook(){
  const app = document.getElementById("app")
  if (app) {
    fetch('https://calendly.com/api/v1/hooks', {
        method: 'POST',
        headers: {
          'X-TOKEN': 'GFNBFHEAABRPXUMMAVMGXLNXESCAJWY7',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          url: "https://financermonautonomie.herokuapp.com/api/v1/projects/2/update_calendly",
          events: ['invitee.created'],
          events: ['invitee.canceled']
        })
    });
  }
}

export { createWebhook }
