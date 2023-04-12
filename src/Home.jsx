import './Home.css';
import React from "react";
import UserList from './UserList'

function Home ({createRating, user, users, selectedGender, genderOptions, handleChangeForCategoryUpdate, updateCategory, setSelectedGender, filterValueSelected }) {



  function filterGender(event){
    filterValueSelected(event.target)
  }



return (
    <>
    <div className="grid-35">
    <select name="gender" onChange={(e) => {
          filterGender(e.target)
          setSelectedGender(e.target)
        }}>
            <option  selected="selected" value="--------------" disabled>--------------</option>
              <option value="All">All</option>
              <option value="Male">Male</option>
              <option value="Female">Female</option>
              <option value="Transgender">Transgender</option>
              <option value="Non-binary">Non-binary</option>
            </select>
            <input type="submit" value="Filter by..."/>
            </div>
    <UserList LoggedInUser={user} users={users} createRating={createRating} handleChangeForCategoryUpdate={handleChangeForCategoryUpdate} updateCategory={updateCategory}/>
    </>
    )
}

export default Home;