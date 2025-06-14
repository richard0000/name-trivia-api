// This runs in the context of Google Meet pages
console.log("Google Meet Poker Planning content script loaded");

// Inject our panel into the Meet UI
function injectPanel() {
  const panelContainer = document.createElement('div');
  panelContainer.id = 'poker-panel-container';
  document.body.appendChild(panelContainer);
  
  // Load our panel HTML
  const panelUrl = chrome.runtime.getURL('panel/panel.html');
  fetch(panelUrl)
    .then(response => response.text())
    .then(html => {
      panelContainer.innerHTML = html;
      // Inject panel JavaScript
      const script = document.createElement('script');
      script.src = chrome.runtime.getURL('panel/panel.js');
      script.onload = function() {
        this.remove();
      };
      document.head.appendChild(script);
    });
}

// Wait for Meet to load
function waitForMeet() {
  if (document.querySelector('[aria-label="Participants"]')) {
    injectPanel();
    identifyParticipants();
  } else {
    setTimeout(waitForMeet, 500);
  }
}

function identifyParticipants() {
  // This is a placeholder - in a real implementation you'd need to:
  // 1. Find the current user (organizer)
  // 2. List all participants
  // 3. Assign roles
  
  console.log("Identifying participants...");
  
  // Simulate getting participants
  chrome.runtime.sendMessage({action: "getParticipants"}, (response) => {
    if (response && response.participants) {
      console.log("Participants:", response.participants);
    }
  });
}

// Start the process
waitForMeet();