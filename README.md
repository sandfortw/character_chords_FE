<p align="center">
  <img src="https://user-images.githubusercontent.com/116698937/232895368-56ae3086-3675-4ee1-a599-1435c6530b1e.png" width="600px" alt="centered image" />
</p>

# Character Chords (Front End)
  Discover your perfect playlist with Character Chords, the app that combines the fun of taking a personality test with the joy of music exploration. Find new music that resonates with you, explore the fictional world of your favorite characters through music, and uncover real-life kindred spirits along the way. Let AI choose your next song for you based on your moral leanings, personality traits, and musical preferences!
## Table of Contents
  - [Directory](#directory)
  - [Technical Details](#technical-details)
    - [Spotify OAuth](#spotify-oauth)
  - [Getting Started](#getting-started)  
  - [Wireframes](#wireframes)
    - [Home Page](#home-page)
    - [Quiz Page](#quiz-page)
    - [Character Page](#character-page)
    - [Playlist Page (not logged in)](#playlist-page-not-logged-in)
    - [Playlist Page (logged in)](#playlist-page-logged-in)
  - [Goals](#goals)
    - [Learning Goals](#learning-goals)
    - [Future Goals](#future-goals)
  - [Contact Us](#contact-us)
  - [Contributors](#contributors)

## Directroy
  [Hosted Website](https://calm-bastion-20348.herokuapp.com/)

  [Backend Service Site](https://frozen-savannah-58383.herokuapp.com/)

  [Backend Repository](https://github.com/hadyematar23/character_chords_back_end)

## Technical Details
  Character Chords is a full-stack Ruby on Rails app that uses a variety of technologies to provide a seamless and engaging music exploration experience. Here are some of the key technologies we use:

  - **`Ruby:`** Character Chords is built with Ruby, a powerful and dynamic programming language that is well-suited to web development.
  - **`Ruby on Rails:`** This application is also built with Ruby on Rails, a powerful web framework for easy web development with APIs and data storage options.
  - **`PostgreSQL:`** We used PostgreSQL for robust web application data storage and management.
  - **`HTML/CSS:`** We use HTML and CSS to create the app's user interface and styling, respectively.
  - **`Tailwind CSS:`** Character Chords leverages Tailwind CSS, a utility-first CSS framework, to create a streamlined and responsive design.
  - **`CircleCI:`** We use CircleCI for our continuous integration and continuous deployment (CI/CD) pipeline, which automates the testing and deployment of new code changes.
  - **`Ruby on Rails CI:`** Character Chords is also tested using Ruby on Rails CI, a GitHub Action that runs tests for Ruby on Rails applications.
  - **`Spotify OAuth:`** We use Spotify OAuth to enable users to log in to the app securely and access their Spotify accounts.
  - **`Amazon S3:`** Character Chords utilizes Amazon S3 for cloud storage, which allows us to securely store and manage user-generated content like playlists and user data.
  - **`External APIs:`** Character Chords consumes external APIs from `Spotify` and `OpenAI` to provide personalized music recommendations based on user preferences and personality traits.
### Spotify OAuth
By using Spotify OAuth, our users can log in securely to their Spotify accounts without the need to create a new account or remember another set of login credentials. By authorizing our app to access their Spotify account, we can retrieve their user data and use it to personalize their experience within our app. This allows our users to seamlessly integrate their existing Spotify preferences with our app. Overall, using Spotify OAuth provides a more personalized and user-friendly experience for our users, which can increase engagement and retention.
## Getting Started
Character Chords is a full-stack Ruby on Rails app that requires you to clone and set up both the [frontend](https://github.com/sandfortw/character_chords_fe) and backend repositories. You will need to ensure all required gems are installed and that environment variables are properly configured in order to run the app locally. Additionally, this app establishes API endpoints for use with the [Character Chords Front End](https://github.com/sandfortw/character_chords_fe) repository.

To get started, clone this repo down and install all gems by running:
``` 
bundle install
```
Next, run this command to make sure the database is properly created and migrated:
```
rails db:{create,migrate}
```
After running that command, inspect `/db/schema` in the application to make sure the database was properly created. This is what the schema for this repo should look like:
![Screenshot 2023-04-21 at 9 56 12 AM](https://user-images.githubusercontent.com/116698937/233668219-86e1993f-4cdc-466c-9db2-1daf3085a4cc.png)

If you'd like to run the test suite for this repo, make sure you are connected to a server (either via the deployment on Heroku or localhost) and run this command:
```
bundle exec rspec spec
```

## Wireframes
### *Home Page*
![Screenshot 2023-04-21 at 11 02 37 AM](https://user-images.githubusercontent.com/116698937/233683474-ca1b28d8-69b7-4b79-95f4-a7c20f03050a.png)

### *Quiz Page*
![Screenshot 2023-04-21 at 11 03 15 AM](https://user-images.githubusercontent.com/116698937/233683518-d94c7b9d-5b23-4996-85ef-ebb1baa32f22.png)

### *Character Page*
![Screenshot 2023-04-21 at 11 04 15 AM](https://user-images.githubusercontent.com/116698937/233683571-0ad022e7-460a-4ef5-b8df-75e647bc2474.png)

### *Playlist Page (not logged in)*
![Screenshot 2023-04-21 at 11 04 46 AM](https://user-images.githubusercontent.com/116698937/233683643-0f443988-11fe-483e-85a5-2e05c83cb4e2.png)

### *Playlist Page (logged in)*
![Screenshot 2023-04-21 at 11 05 58 AM](https://user-images.githubusercontent.com/116698937/233683826-14db06d6-feb7-4b3d-99e8-76dc2479cc8a.png)

## Goals
- ### Learning Goals
  - Create a web application that solves a real world problem and utilizes Service-Oriented Architecture (SOA).
  - Implement authentication via OAuth and consume at least two other APIs.
  - Develop a Rails "back end" API that acts as the interface layer to the database, handles API consumption, and uses Serializers.
  - Gain professional development benefits such as experience working on a larger team, understanding the impact of changes on a system, and familiarity with SOA/multi-app systems.
- ### Future Goals
  - With additional time and resources, we would like to implement the ChatGPT API in at least two other locations in the project. First, in the creation of the questions and answers for quizzes. We would like for the user to be able to input a profession or a theme and then receive the relevant alignment questions based off of their input. As of the production of this project (April 2023), the API only supports Chat GPT3.5 and not 4.0, making longer and more complex queries more volatile based on user input. 
  - We would also like to implmenet DALL-E 2, the image generator of Open AI to provide a fictional album cover that is based off of the individual user's character selected and music genre. We would then upload the image to the user's Spotify playlist and send them the image in PDF format along with their playlist selection. 

## Contact Us
  Thank you for using Character Chords! If you have any questions, suggestions, or bug reports, please don't hesitate to get in touch. You can contact us by creating a new issue on this repo page. We appreciate your feedback and look forward to hearing from you!

## Contributors
<table>
  <tr>
    <th>Hady Matar</th>
    <th>Harrison Ryan</th>
    <th>James Taylor</th>
    <th>Weston Sandfort</th>
  </tr>
  
<tr>
  <td><img src="https://avatars.githubusercontent.com/u/115317749?v=4" width="150" height="150"></td>
  <td><img src="https://avatars.githubusercontent.com/u/116698937?v=4" width="150" height="150"></td>
  <td><img src="https://avatars.githubusercontent.com/u/117054959?v=4" width="150" height="150"></td>
  <td><img src="https://avatars.githubusercontent.com/u/80081206?v=4" width="150" height="150"></td>
</tr>


  <tr>
    <td>
      <a href="https://github.com/hadyematar23"  rel="nofollow noreferrer">
          <img src="https://i.stack.imgur.com/tskMh.png" alt="github"> Github
        </a><br>
      <a href="https://www.linkedin.com/in/hady-emmanuel-matar/" rel="nofollow noreferrer">
    <img src="https://i.stack.imgur.com/gVE0j.png" alt="linkedin"> LinkedIn
        </a>
    </td>
        <td>
       <a href="https://github.com/hwryan12" rel="nofollow noreferrer">
            <img src="https://i.stack.imgur.com/tskMh.png" alt="github"> Github
      </a><br>
        <a href="https://www.linkedin.com/in/harrison-ryan-2b987725a/" rel="nofollow noreferrer">
          <img src="https://i.stack.imgur.com/gVE0j.png" alt="linkedin"> LinkedIn
      </a>
    </td>
        <td>
       <a href="https://github.com/JTaylor28" rel="nofollow noreferrer">
          <img src="https://i.stack.imgur.com/tskMh.png" alt="github"> Github
      </a><br>
        <a href="https://www.linkedin.com/in/james-taylor-a02a7a199/" rel="nofollow noreferrer">
          <img src="https://i.stack.imgur.com/gVE0j.png" alt="linkedin"> LinkedIn
      </a>
    </td>
        <td>
       <a href="https://github.com/sandfortw" rel="nofollow noreferrer">
            <img src="https://i.stack.imgur.com/tskMh.png" alt="github"> Github
      </a><br>
        <a href="https://www.linkedin.com/in/westonsandfort/" rel="nofollow noreferrer">
          <img src="https://i.stack.imgur.com/gVE0j.png" alt="linkedin"> LinkedIn
      </a>
    </td>
  </tr>   
</table>
