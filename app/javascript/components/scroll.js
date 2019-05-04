function scrollLastMessageIntoView() {
  // const messages = document.querySelectorAll('.message');
  // const lastMessage = messages[messages.length - 1];
  // if (lastMessage !== undefined) {
  //   lastMessage.scrollIntoView({block: "end", inline: "nearest"});
  // }
  const btn = document.getElementById('envoyer')
  if (btn) { btn.scrollIntoView({block: "end", inline: "nearest"}); }
  const link = document.getElementById('send_to_analyze')
  if (link) { link.scrollIntoView({block: "end", inline: "nearest"}); }

}

export { scrollLastMessageIntoView }
