/**
 * 사용하시게 될때는 apikey 주석 풀어주세요!
 */

import 'https://www.gstatic.com/firebasejs/9.0.2/firebase-app-compat.js';
import 'https://www.gstatic.com/firebasejs/9.0.2/firebase-firestore-compat.js';

const firebaseConfig = {
//    apiKey: "AIzaSyDHGw0dG23cGk-D9RErPdIGQrHPgfRrw-I",
    authDomain: "indi-flicker.firebaseapp.com",
    projectId: "indi-flicker",
};

firebase.initializeApp(firebaseConfig);
const db = firebase.firestore();

// module 로 firestore 사용중
export { db };