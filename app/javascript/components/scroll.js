function scrollLastMessageIntoView() {
  // const messages = document.querySelectorAll('.message');
  // const lastMessage = messages[messages.length - 1];
  // if (lastMessage !== undefined) {
  //   lastMessage.scrollIntoView({block: "end", inline: "nearest"});
  // }

  const btn = document.getElementById('envoyer')
  btn.scrollIntoView({block: "end", inline: "nearest"});
}

export { scrollLastMessageIntoView }
