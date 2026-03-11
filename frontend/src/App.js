import React from 'react';

function App() {
  return (
    <div style={{ fontFamily: 'sans-serif', textAlign: 'center', padding: '2rem' }}>
      <h1>📡 NewsRadar</h1>
      <p>Sistema de monitorización de noticias</p>
      <p style={{ color: '#888' }}>API: {process.env.REACT_APP_API_URL || 'http://localhost:8000/api/v1'}</p>
    </div>
  );
}

export default App;
