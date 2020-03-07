let map = {
  "add-ons": "addons.md",
  "apkg-export": "exporting.md",
  "currentnote-preview": "templates/intro.md",
  "reviewing-ahead": "filtered-decks.md",
  "what-algorithm": "faqs.md",
  addingnotes: "editing.md",
  backups: "preferences.md",
  basics: "getting-started.md",
  browser: "browsing.md",
  browsermisc: "browsing.md",
  cardlist: "browsing.md",
  cardtypedefinitions: "stats.md#types-of-cards",
  cloze: "editing.md#cloze-deletion",
  columntemplates: "templates/styling.md#browser-appearance",
  deckoptions: "deck-options.md",
  deckoverride: "templates/intro.md",
  deckoverview: "studying.md#study-overview",
  displayorder: "studying.md#display-order",
  editmore: "studying.md",
  editor: "editing.md",
  exporting: "exporting.md",
  fields: "editing.md#customizing-fields",
  fieldstyling: "templates/styling.md",
  files: "files.md",
  filtered: "filtered-decks.md",
  findreplace: "browsing.md",
  lapses: "deck-options.md",
  latex: "math.md",
  learning: "studying.md#learning",
  manydecks: "editing.md#using-decks-appropriately",
  media: "media.md",
  mediarefs: "templates/fields.md",
  mergingconflicts: "syncing.md#merging-conflicts",
  notetypes: "getting-started.md",
  preferences: "preferences.md",
  profileprefs: "preferences.md",
  searching: "searching.md",
  siblings: "studying.md#siblings-and-burying",
  specialfields: "templates/fields.md#special-fields",
  stats: "stats.md",
  syncing: "syncing.md",
  templates: "templates/intro.md",
  templatesrtl: "templates/styling.md",
  typinganswers: "templates/fields.md#checking-your-answer"
};

let head = "https://docs.ankiweb.net/#/";

function pathToURL(path) {
  return head + path.replace(".md", "");
}

function newURL(hash) {
  let key = hash.replace("#", "");
  if (map[key]) {
    return pathToURL(map[key]);
  } else {
    return head;
  }
}

window.location = newURL(window.location.hash);
