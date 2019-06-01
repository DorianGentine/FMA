function scrollLastMessageIntoView(element) {
  element.lastChild.scrollIntoView({block: "end", inline: "nearest"})
  element.scrollBy(0, 20);
}

export { scrollLastMessageIntoView }
