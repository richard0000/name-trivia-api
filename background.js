// Background service worker for the extension
chrome.runtime.onInstalled.addListener(() => {
  console.log('Google Meet Poker Planning extension installed');
});

// Handle messages from content script
chrome.runtime.onMessage.addListener((request, sender, sendResponse) => {
  if (request.action === "getParticipants") {
    // In a real implementation, this would come from Meet's API
    sendResponse({participants: []});
  }
});