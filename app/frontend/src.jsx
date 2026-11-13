import React from "react";
import { createRoot } from "react-dom/client";

function App() {
  return (
    <main style={{fontFamily:"Arial",padding:"50px"}}>
      <h1>Secure Kubernetes DevSecOps Platform</h1>
      <p>React + Django + PostgreSQL</p>
      <p>GitHub Actions | Vault | Argo CD | Kubernetes | Grafana</p>
    </main>
  );
}

createRoot(document.getElementById("root")).render(<App />);
