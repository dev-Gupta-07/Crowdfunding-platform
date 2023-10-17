// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract CrowdFunding {
    struct Compaign{
        address owner;
        string title;
        string description;
        uint256 target;
        uint deadline;
        uint amountCollected;
        string image;
        address[] donators;
        uint256[] donations;
    }



    mapping (uint256 => Compaign)public compaigns;
    uint256 public numberOfCompaigns=0;
    function createCompaign(address _owner, string memory _title,string memory _description,uint256 _target,uint256 _deadline,string memory _image) public returns (uint256){
      Compaign storage compaign=compaigns[numberOfCompaigns];
      // to see everything ok
      require(compaign.deadline < block.timestamp,"The daedline should be a date in future");
      compaign.owner=_owner;
      compaign.title=_title;
      compaign.description=_description;
      compaign.target=_target;
      compaign.deadline=_deadline;
      compaign.amountCollected=0;
      compaign.image=_image;
      numberOfCompaigns++;

      return numberOfCompaigns-1;   
    }
    function donateToCompaign(uint256 _id)public payable{
       uint256 amount= msg.value;

       Compaign storage compaign=compaigns[_id];
       compaign.donators.push(msg.sender);
       compaign.donations.push(amount);

       (bool sent,) =payable(compaign.owner).call{value:amount}("");
       if(sent)
       {
        compaign.amountCollected=compaign.amountCollected+amount;
       }


    }
    function getDonators(uint256 _id)view public returns(address[] memory,uint256[] memory){
       return (compaigns[_id].donators,compaigns[_id].donations);
    }
    function getCompaigns() public view returns(Compaign[] memory)
    {
          Compaign[] memory allCompaigns=new Compaign[](numberOfCompaigns); // we have an emty array of compaign struucture

          for(uint i=0;i<numberOfCompaigns;i++)
          {
            Compaign storage item=compaigns[i];
            allCompaigns[i]=item;
          }
          return allCompaigns;
    }
}