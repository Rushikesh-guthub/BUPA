import React from 'react';
import { Link } from 'react-router-dom';

const Home = () => {
  return (
    <div>
      <h2>Welcome Hometest1</h2>
      <Link to="/login">Login</Link> | <Link to="/register">Register</Link>
    </div>
  );
};

export default Home;
