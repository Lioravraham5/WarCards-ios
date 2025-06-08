# 🃏 Cards War - iOS Card Game App
**Cards War** is a classic two-player card game implemented as an iOS application using Swift and the MVC design pattern. In this game, you compete against the computer in a battle of randomly drawn cards, enhanced with sound effects, location-based logic, and a timer-based game flow.

### Light Mode:
https://github.com/user-attachments/assets/0359fa53-cb1f-44b9-b135-1c517c4a7e31

### Dark Mode:
https://github.com/user-attachments/assets/5e5df423-d37a-4b24-9e66-aecf63f7f0b1

## 📲 Overview
War is a fun, interactive card game that pits the player against a computer opponent in a series of 10 rounds. Each round, both players flip a card. The card with the higher power wins the round and earns a point. After 10 rounds, the player with the most points is declared the winner — unless there's a tie, in which case the PC wins by default.

## 🎮 Features

### 🌍 Location-Based Player Side
- When entering the app, your location is sampled.
- If your longitude is east of `34.8175491683243340`, you're assigned the **East** side. Otherwise, you're on the **West**.
- This decision affects which side you're displayed on in the game.

### ✏️ Persistent User Name
- Users input their name once, and it’s stored using `UserDefaults`.
- The name is reused in future sessions automatically.

### ⏱ Game Timer and Rounds
- The game runs automatically, flipping cards every 5 seconds using a custom `Ticker`.
- Each card is shown for 3 seconds, then flipped back.
- A timer counts how long the user has played.

### 🔊 Sound System
- Background music plays during gameplay, and pauses/resumes with the game.
- Sound effects are used for card flips, winning, and losing.
- Managed by a centralized `SoundManager` supporting two channels: one for background music and one for effects.

### 🎆 Visual Effects
- A confetti effect is triggered when the player wins.
- Clean animations for card flip-backs after each round.

## Screens Shots
### Horizontally – Light Mode
<div style="display: flex; justify-content: space-between; gap: 10px;">
  <img src="https://github.com/user-attachments/assets/30a36ac6-f75b-41f7-a5a0-06e6415cfb1e" alt="Image 2" style="width: 50%; height: 50%;">
  <img src="https://github.com/user-attachments/assets/abeaf213-6a03-416c-97d5-ce4b6c460b46" alt="Image 1" style="width: 50%; height: 50%;">
  <img src="https://github.com/user-attachments/assets/31824ce1-91e7-4288-b340-9bd68d874262" alt="Image 1" style="width: 50%; height: 50%;">
</div>

### Vertically – Light Mode
<div style="display: flex; justify-content: space-between; gap: 10px;">
  <img src="https://github.com/user-attachments/assets/d964b96e-1dd5-4dd6-961f-914997fe729a" alt="Image 2" style="width: 20%; height: 20%;">
  <img src="https://github.com/user-attachments/assets/b37c2f68-8fda-446e-89be-c62f00e89e5a" alt="Image 1" style="width: 20%; height: 20%;">
  <img src="https://github.com/user-attachments/assets/1f898597-0daf-42e2-9ebb-879da2dcfc9c" alt="Image 1" style="width: 20%; height: 20%;">
</div>

### Horizontally – Dark Mode
<div style="display: flex; justify-content: space-between; gap: 10px;">
  <img src="https://github.com/user-attachments/assets/9f529d31-ae53-4f72-8ff5-3da9626d7bae" alt="Image 2" style="width: 50%; height: 50%;">
  <img src="https://github.com/user-attachments/assets/03820bf8-4423-489b-805e-df35987d226f" alt="Image 1" style="width: 50%; height: 50%;">
  <img src="https://github.com/user-attachments/assets/08601743-2875-43ef-90c5-47ca7e33eaa6" alt="Image 1" style="width: 50%; height: 50%;">
</div>

### Vertically – Dark Mode
<div style="display: flex; justify-content: space-between; gap: 10px;">
  <img src="https://github.com/user-attachments/assets/7f5f6a26-89e5-4fdf-b5d4-f2a305e7f0c7" alt="Image 2" style="width: 20%; height: 20%;">
  <img src="https://github.com/user-attachments/assets/8461d852-0310-41c0-aaa3-ab5f87ba8e7a" alt="Image 1" style="width: 20%; height: 20%;">
  <img src="https://github.com/user-attachments/assets/c79790c3-d5ae-4d08-a675-52ddc6005706" alt="Image 1" style="width: 20%; height: 20%;">
</div>
