import React from 'react';
import ReactDOM from 'react-dom/client';
import {BrowserRouter as Router} from 'react-router-dom';
import './index.css';
import { StateContextProvider } from './context';
import {ChainId,ThirdwebProvider} from '@thirdweb-dev/react';
import { Sepolia} from "@thirdweb-dev/chains";
import App from './App';
const root=ReactDOM.createRoot(document.getElementById('root'));

root.render(
    <ThirdwebProvider activeChain={Sepolia}>
        <Router>
            <StateContextProvider>
             <App>
               
            </App>

            </StateContextProvider>
           
        </Router>


    </ThirdwebProvider>
)