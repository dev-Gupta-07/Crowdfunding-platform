import React from 'react'
import{Route,Routes} from 'react-router-dom';
import { CompaignDetails,CreateCompaign,Home,Profile} from './pages';
import {Sidebar,NavBar} from './components'
const App = () => {
  return (
    <div className="relative sm:-8 p-4 bg-[#13131a] min-h-screen flex flex-row">
      <div className="sm:flex hidden mr-10 relative">
        
        <Sidebar/>
      </div>
    

      <div className="flex-1 max-sm:w-full max-w-[1280px] mx-auto sm:pr-5">
       <NavBar/>
        <Routes>
          <Route path="/" element={<Home/>}/>
           <Route path="/profile" element={<Profile />} />
           <Route path="/create-campaign" element={<CreateCompaign></CreateCompaign>} />
          <Route path="/campaign-details/:id" element={<CompaignDetails></CompaignDetails>} />
          
        </Routes>
      </div>
    </div>
  )
}

export default App
