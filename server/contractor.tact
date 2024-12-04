// UserDetails.tact

// Define the user structure to store name and reward amount
struct User {
    name: String;
    rewardAmount: Uint256;
}

// Define a mapping to store user details by their address
var userDetails: map(address, User);

// Function to set user details
func setUserDetails(name: string, rewardAmount: uint256) public {
    let userAddress = msg.sender;  // Get the sender's address
    userDetails[userAddress] = User{name, rewardAmount};  // Store the details in the mapping
}

// Function to get user details by address
func getUserDetails(userAddress: address) public view returns (string, uint256) {
    let user = userDetails[userAddress];  // Retrieve the user details from the mapping
    return (user.name, user.rewardAmount);  // Return the name and reward amount
}

// Function to update the reward amount of a user
func updateRewardAmount(newRewardAmount: uint256) public {
    let userAddress = msg.sender;  // Get the sender's address
    let user = userDetails[userAddress];  // Get the current user details
    user.rewardAmount = newRewardAmount;  // Update the reward amount
    userDetails[userAddress] = user;  // Store the updated user details
}
