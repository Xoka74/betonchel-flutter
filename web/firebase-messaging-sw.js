importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyDB-xplRkuga9Z98FVi6PLKJSkge8JOacE",
  authDomain: "betonchel-manager.firebaseapp.com",
  projectId: "betonchel-manager",
  storageBucket: "betonchel-manager.appspot.com",
  messagingSenderId: "172629619433",
  appId: "1:172629619433:web:b258068d5a3c029f90f678",
});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);

   const notificationTitle = 'Background Message Title';
   const notificationOptions = {
     body: 'Background Message body.',
     icon: '/firebase-logo.png'
   };

   self.registration.showNotification(notificationTitle, notificationOptions);
});