[oodls : Food Waste Project](http://www.oodlsio.herokuapp.com)
==========================

[![Code Climate](https://codeclimate.com/github/Callisto13/Oodls/badges/gpa.svg)](https://codeclimate.com/github/Callisto13/Oodls) [![Test Coverage](https://codeclimate.com/github/Callisto13/Oodls/badges/coverage.svg)](https://codeclimate.com/github/Callisto13/Oodls)

This was our final two-week challenge at Makers Academy.  We sought to create a web application to connect individuals with surplus food to those local charities and organisations in need.  This was a [team challenge](#team) drawing on an initial idea from [Claudia Beresford](https://github.com/Callisto13) and [the original project is hosted here on Heroku.](http://www.oodlsio.herokuapp.com)

###Index Of Contents
- <a href="#the-cause--resources">The Cause : Resources</a>
- <a href="#the-cause--some-killer-stats">The Cause : Some Killer Stats</a>
- <a href="#our-minimum-viable-product--basic-user-story">Our Minimum Viable Product & Basic User Story</a>
- <a href="#name-branding--promotion-ideas">Name, Branding & Promotion Ideas</a>
- <a href="#screenshots--the-final-product">Screenshots : The Final Product</a>
- <a href="#why-was-tesco-integrated-into-a-charitable-platform">Why Was Tesco Integrated Into A Charitable Platform?</a>
- <a href="#why-the-tesco-data--scheme-is-important">Why The Tesco Data & Scheme Is Important</a>
- <a href="#how-we-could-extend--improve-this-project">How We Could Extend & Improve This Project</a>
- <a href="#team-members">Team Members</a>
- <a href="#technologies">Technologies</a>

<p>
<p>
<img src="https://raw.githubusercontent.com/benhutchinson/Oodls/master/public/images/presentationfront.png">


###The Cause : Resources
Here are some links that give further background on the topic.  Ben has summarised some of the key points from the House of Commons report in [a separate page here.](https://github.com/Callisto13/Oodls/blob/master/NotesHouseOfCommons.md) but also extracted some statistics that caught his eye from the sources below.
* [FareShare](http://www.fareshare.org.uk/)
* [FareShare Food Guidelines](http://www.fareshare.org.uk/wp-content/uploads/2014/12/Food-offers-Guidelines-2014-15.pdf)
* [FoodCycle](http://foodcycle.org.uk/)
* [2015 House of Commons Environment, Food and Rural Affairs Committee Report: Food security: demand, consumption and waste](http://www.publications.parliament.uk/pa/cm201415/cmselect/cmenvfru/703/703.pdf)
* [2010-2012 Food Waste Bill](http://services.parliament.uk/bills/2010-12/foodwaste.html)
* [Love Food Hate Waste](http://england.lovefoodhatewaste.com/node/2472)
* [Tesco Food Collection](http://foodcollection.tesco.com/#donate-in-store)


###The Cause : Some Killer Stats
* Almost 50% of the total amount of food thrown away in the UK comes from our homes.  Each year a consumers, we throw away 7 million tonnes of food and drink from our homes in the UK.  More than half of this is food and drink we could have eaten.  We throw away more food from our homes than packaging in the UK every year and an area almost the size of Wales would be needed to grow all of the food we throw away each year. (Source: [Love Food Hate Waste](http://england.lovefoodhatewaste.com/node/2472))

* FareShare provided 13.2m meals last year and state that over 82,000 people benefit from FareShare food per day.  They believe the beneficiary charities that they serve saved costs of around £13k as a result.  Despite this, they believe that they are currently handling just 1.5% of surplus food available in the UK.  They believe that c800m meals could be provided having assessed food wasted and a proportion that is fit for consumption.

* Positive Trends: [According to Love Food Hate Waste](http://england.lovefoodhatewaste.com/node/2472)), between 2007 and 2012 avoidable food waste has been reduced by 21%, equivalent to over 1 million tonnes.  [Tesco's national collections](http://foodcollection.tesco.com) have grown in size.  November 2014 was their fifth collection and raised 4.7 million meals vs the first in December 2012 which raised 2.4 million meals.

* More.  Per the above, I have summarised some of the key points from the House of Commons report in [a separate page here.](https://github.com/benhutchinson/Oodls/blob/master/NotesHouseOfCommons.md) 


###Our Minimum Viable Product & Basic User Story
An individual consumer with spare food to donate should be able to visit our site, enter a post-code, and then be presented with a list of local charities that would accept their food.  The applicable charities' locations should be clearly presented and sorted according to their proximity, with some parallels to the likes of [Freecycle](https://www.freecycle.org/), [Freegle](https://ilovefreegle.org/), and [Gumtree.](http://www.gumtree.com)  [Full wireframe graphics illustrating our user story & graphical user interface design plans can be seen here](https://github.com/benhutchinson/Oodls/blob/master/ideas.md#gui--user-story) along with [Claudia's more extensive, original MVP here.](https://github.com/benhutchinson/Oodls/blob/master/mvp.md)  A scaled down version of our user story is shown below.

<p>
<img src="https://raw.githubusercontent.com/benhutchinson/Oodls/master/public/images/smalluserstory.png">


###Name, Branding & Promotion Ideas
We were keen to almost gamify the topic and brand through an animal character to engage people of all ages.  Meercats have little to do with insurance but are memorable.  Oodles the Owl, Foodles, Share Bear, Town Mouse vs Country Mouse, seemed to be some of the key ideas that grabbed us, with oodles seeming the most catchy.  The name became Oodls following domain name considerations.  [Alan's initial draft logos can be viewed here.](https://github.com/benhutchinson/Oodls/blob/master/ideas.md#logo-iterations) 


###Screenshots : The Final Product
Our final product placed Google Maps at the centre of the user experience.  A user can enter any post-code or allow our site to access their current geolocation and upon submit, be presented with a full-size map illustrating local charities and Tesco stores (more to come) that would accept their produce.  Charities are denoted by "Oodls" owl pins, while Tesco stores are distinguished through the Tesco logo.  On clicking a charity pin, a user is presented with an info-window outlining opening hours, the key products that the charity is currently accepting, and links to a more detailed charity profile page.  The pin also links neatly to Google Maps externally should a user need directions and wish to take advantage of varied forms of transportation.  Tesco pins offer the very basics of Tesco's scheme and provide a link to Tesco's Food Donation literature.  The design of the app is responsive hence renders nicely on mobile devices and is integrated with both Twitter and Google Analytics.  


<p>
<img src="https://raw.githubusercontent.com/benhutchinson/Oodls/master/public/images/charityscreen.png">


<p>
<img src="https://raw.githubusercontent.com/benhutchinson/Oodls/master/public/images/tescoscreen.png">


<p>
<img src="https://raw.githubusercontent.com/benhutchinson/Oodls/master/public/images/twitter.png">

<p>
<img src="https://raw.githubusercontent.com/benhutchinson/Oodls/master/public/images/twittercard.png">



### Why Was Tesco Integrated Into A Charitable Platform?
[Tesco have a Food Collection Programme](http://foodcollection.tesco.com/#donate-now) that is well-integrated with their nationwide store network.  They actually hold over 350 permanent food collection points across many of their stores in the UK with the donated produce supplied to FareShare and The Trussell Trust.  At these stores, consumers are welcome to donate food items of any brand (including competitors) from the pre-approved lists below, effectively aiding beneficiary foodbanks.  Tesco also top up these consumer donations with money and state that their alliance with FareShare has helped provide the equivalent of seven million meals a year of surplus food.  Tesco themselves divert all surplus fresh food from their distribution centres and online grocery centres to FareShare, adding more fresh produce such as chicken, peppers, apples and other fresh fruit and vegetables.

### Why The Tesco Data & Scheme Is Important
As the precise data regarding those 350 Tesco collection points is a little scattered and/or non-existent, we contacted Tesco's customer service and investor relations teams to collect the store data.  To their credit, they supplied us with appropriate CSV files and hence we were able to use these to translate post-codes into co-ordinates and present those stores as pins on our map.  Nothing so simple currently exists for the Tesco consumer (or food donor).  We saw this as important from a practical and usability perspective.  Supermarket hours can be more consistent and extensive and the network of drop-off points is broad and hence this would be of use to those donors who have the will but are simply time poor.  The immediate beneficiaries of this Tesco service are Fareshare and The Trussell Trust The service and we saw the facility a little analogus to Amazon's locker service.  Most importantly, it would ensure our platform is immediately populated with over 350 legitimate drop-off points that a donor could visit today.  The platform would be usable "out-of-the-box" and be less likely to stagnate allowing charity registrations to gradually unfold.


###How We Could Extend & Improve This Project
- Firstly, there would be nothing stopping us integrating other commercial entities beyond Tesco that partner with foodbanks.  We could even provide a registration facility for this, recognising that many supermarkets determine their relations with local foodbanks at the regional store-level and hence the data-set is just more fragmented and harder to come by compared to Tesco.  We could allow this facility to be turned on/off should a commercial provider have a change of policy or a donor have a preference to support different institutions.  We could also deploy customised marker icons so that users could clearly identify the type of drop-off points on the map.
- We could offer our unique and evolving data-set in the form of a RESTful API. 
- We could allow users to perform more filtered searches, perhaps according to opening hours.  Users are currently able to filter according to the type of produce that they wish to donate.
- The site could integrated with more social platforms such as Facebook.  A tweeting campaign to raise awareness of the cause, perhaps aligned to recipes or small tips that could help consumers waste less food.
- We could develop admin functionality allowing admin users to more easily manage the site, quality-control listings, and monitor any abuse of the service.
- We could allow individual donors to register.  Our system does not track actual donations and hence it is hard to proxy the effectiveness of our campaign, the incremental donations it engenders, and incremental foot-fall that Tesco would receive.  If we could track individual donations more tightly, potentially we could integrate merchandise, rewards, stickers, badges, etc.  This would facilitate individual charities to contact those that have donated to them in particular times of need or to simply market their cause.  We could also develop a 'live map' showing donations as and when they occur.
- Could our system be designed such that it is more closely integrated into a transportation service such as a Boris-Bike or Uber-type infrastructure?  Could we go further to integrate donors, their donations, the destinations and the prevailing transport network?
- [Crisis](http://www.crisis.org.uk/) on Commercial Street work with FareShare and maintain Daily rather than static menus, partly to reflect some of the diversity in the donations they receive.  This could offer inspiration for a cook-book since it requires them to be consistently inventive in using up whatever produce they have to hand.  [FoodCycle](http://foodcycle.org.uk/recipes/) have something a little like this on their web-site and even have recipes from celebrity chefs such as Ken Hom.
- Hotel & Corporate Waste could be another future donor-base to target.
- [Love Food Hate Waste have a mobile app](http://england.lovefoodhatewaste.com/content/download-new-love-food-hate-waste-free-app) that has some synnergies with our idea.  This also links to the API idea above.
- From a technological point of view, we could aid more charities to sign-up and check that our site's support for older browsers through facilities such as [Modernizr](http://modernizr.com/).


[](#team)<a name="team"></a>
### Team Members
- [Claudia Beresford](https://github.com/Callisto13)
- [Alan Bridger](https://github.com/abridger)
- [Izzy Markwick](https://github.com/imarkwick)
- [Ben Hutchinson](https://github.com/benhutchinson)

### Technologies

- Rails, Ruby, Rspec/Capybara
- Devise
- Foundation
- Google Maps API & Gmaps.Js
- Adobe Illustrator
- Mandrill

### Still to do:
- trim this readme, add takeaway section
- refactor
- delete ghost files
- everything else on my hard-copy list