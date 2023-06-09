import User from './User'
function UserList({createRating, LoggedInUser, users, handleChangeForCategoryUpdate, updateCategory}) {

    console.log("hello")

    const userComponent = users.map((user) => {
        if(user.id !== LoggedInUser.id){
            return <User key={user.id} user={user} LoggedInUser={LoggedInUser} createRating={createRating} updateCategory={updateCategory} handleChangeForCategoryUpdate={handleChangeForCategoryUpdate}/>
        }
        else {
        return null
    }

    })
    
    return (
        <>
        {userComponent}
        </>
    )
}

export default UserList;