import User from './User'
import Category from './Category'
function UserList({createRating, LoggedInUser, users, handleChangeForCategoryUpdate, updateCategory}) {

    console.log("hello")

    const categoryComponent = users.map((user) => {
        if(user.id !== LoggedInUser.id){
            return <User key={user.id} user={user} LoggedInUser={LoggedInUser} createRating={createRating} updateCategory={updateCategory} handleChangeForCategoryUpdate={handleChangeForCategoryUpdate}/>
        }
        else {
        return null
    }

    })
    
    return (
        <>
        {categoryComponent}
        </>
    )
}

export default UserList;