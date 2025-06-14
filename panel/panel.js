// This runs in the context of the injected panel
document.addEventListener('DOMContentLoaded', () => {
  // Handle voting buttons
  const voteButtons = document.querySelectorAll('.vote-btn');
  voteButtons.forEach(button => {
    button.addEventListener('click', () => {
      voteButtons.forEach(btn => btn.classList.remove('selected'));
      button.classList.add('selected');
      const value = button.dataset.value;
      console.log(`Voted: ${value}`);
      // In a real implementation, this would send the vote to your backend
    });
  });

  // Simulate adding participants (in real app, this would come from Meet)
  const participantsContainer = document.getElementById('participants-container');
  
  // Example participants
  const exampleParticipants = [
    { name: "You (Moderator)", role: "moderator", vote: null },
    { name: "John Doe", role: "participant", vote: "5" },
    { name: "Jane Smith", role: "participant", vote: null },
    { name: "Alex Johnson", role: "participant", vote: "8" }
  ];

  exampleParticipants.forEach(participant => {
    const li = document.createElement('li');
    li.innerHTML = `
      <span>${participant.name}</span>
      <span class="vote-display">${participant.vote || '-'}</span>
    `;
    participantsContainer.appendChild(li);
  });
});