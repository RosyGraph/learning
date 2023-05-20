"use strict";

function LikeButton() {
  const [likes, setLikes] = React.useState(0);

  return <button onClick={() => setLikes(likes + 1)}>Like {likes}</button>;
}

const rootNode = document.getElementById("like-button-root");
const root = ReactDOM.createRoot(rootNode);
root.render(React.createElement(LikeButton));
