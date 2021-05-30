# Flask vs Node.js

For more than two years now I have been using Node.js for almost all of the backend servers I have built. The vast majority of these were using Express.js, although I did play around with Koa.js towards the beginning, and even made a brief foray into _bare_ Node.js as part of the [bootcamp](https://codeworks.me/) I participated in. Node.js has one distinct advantage which is that being a JavaScript runtime environment on the server, it allows for the use of a single language up and down the stack, meaning that developers can - in theory - seamlessly switch between sections of a project. With frameworks like React.Native now enabling JavaScript development for mobile devices, it is *theoretically* possible to build an entire application exclusively in one language. 

After 18 months working with React.Native I have serious reservations about it, and implore anyone looking to the framework as the silver bullet to consider the potential pitfalls - a whole different topic. Node.js on the other hand is far more mature, and to be fair, it has allowed me to build a variety of applications with notable success. But the first language I learned wasn't JavaScript, it was Python. I imagine this is quite common, as Python appears to have a sexier reputation amongst non-engineers, for the most part due to its association with data science, academia, fin-tech and the fact many people I'd worked with in banking had, at one point or another, written a few lines of Python. Although I am far more proficient in JavaScript than in Python, I often think about building applications in the latter. I built one application with [Django](www.saga47swan.com), which I found too bloated and opinionated for my liking. Recently, the opportunity arose to do just that with the Flask web framework. These are my thoughts on how Flask and Python compare to Node.js. 

```bash
# Set Starting Positions
```

```python
flask = 0
```

```javascript
let node = 0;
```

## Single Language Across the Stack

For a long time I really didn't see how having JavaScript in both the back and Front-End was all that valuable. With time I have concluded that it is an advantage, albeit not a huge one. My thinking was essentially that, having hired and managed teams of engineers, my experience tells me, that unless its a tiny start-up with less than a couple of engineers, the team ends up specialising anyway, at least to some extent in a specific part of the project. The concept of the *Production Possibilities Frontier* in economics it quite applicable to the fields of software engineering in this case. The chart below demonstrates how _Engineer One_ and _Engineer Two_ achieve can achieve a total productivity increase through specialisation. While this example is highly simplistic, in tech, as with in business and management [Occam's Razor](https://en.wikipedia.org/wiki/Occam%27s_razor) usually holds.  

![Production Possibilities Frontier - Front-End Engineer vs. Back-End Engineer](../assets/ppf_001.png)

*Lets say that the Orange line represents a front-end specialised engineer who can achieve a maximum possible output of 100 units of value through specialisation. However, if that same engineer switches into the back-end, they can achieve only 30 units of value. The situation - which applies equally, but inversely, to the white line, representing a back-end engineer - also indicates that any combination of balance between back-end and front-end work still results in a productive output that is less than the maximum.*

Of course, there are other factors outside of pure productivity, such as learning, exposure to new technologies and code that would improve motivation. But experience tells me that the moment you have more than a single engineer working on a project, it is highly possible that the optimal output and project execution speed and quality will be achieved through some degree of specialisation. So the argument becomes less that the developer can shift across the project and more that the developer can understand the code in other parts of it. This is true, but it is also true that the shift from JavaScript to Python is not a tremendous one, and that any engineer worth their salt should be at least able to handle that gap, although this theory wouldn't be quite so true in the case of a shift from JavaScript to C++ or Java for example. Nevertheless, while the technology most appropriate to the task should be chosen - where practical -, Python is not an option in the browser while JavaScript does run on the server. This simple truth means Node takes a point.

```javascript
node++;
```

## Syntax

JavaScript's syntax has grown on me with time, and, despite the language's strangeness in many aspects, is not always visually that dissimilar to other languages like Java (especially when using TypeScript). Python on the other hand is famed for its simple syntax that *reads like English*. Even now, having come to appreciate JavaScript's flexibility and quirks, I still prefer the way Python reads, including the use significant white space. The easier it is to express your thoughts in code the better, because, it allows for greater concentration on the actual conceptual problem rather than on the implementation. If you haven't seen a piece of code before, then pythons syntax will make understanding that code easier, assuming that you have an equally sound understanding of each language (and that the code is clean!). It is for this reason that I can understand Python's success in non-IT fields such as finance and economics where those employing the language are themselves not programmers, and see a language as a tool or a means to an ends. While JavaScript's evolution leaves it feeling more modern, it is still less beautiful in my opinion, and far more difficult for a beginner to grasp too. 

```python
python += 1
```

## Types

It is possible to use type declarations in Python (known as hints), but when it comes to the successful implementation of types more broadly, JavaScript (well TypeScript obviously) wins hands down. In fact even the army of JavaScript haters are likely to concede that TypeScript has been transformative for the JavaScript ecosystem. Not only does TypeScript drastically improve the development experience from the standpoint of the engineer, it also promotes better structures and practices and more often than not leads to a cleaner, more well structured and better maintained code base. For myself personally, learning TypeScript was a watershed moment, and addressed many of the frustrations that I had with JavaScript. The first time I built a module using TypeScript, it worked the first time I ran it. Anyone with experience writing JavaScript will be all too aware of how significant this is.

The growing prevalence of TypeScript also builds upon the aforementioned advantage of using the *single language across the stack* advantage. Specifically through the sharing of common types. Type declarations on the front and back-end of the project and can easily be modularised and imported into each respective repository. This definitely results not only in less time spent coding the same features, but also promotes consistency across the project. 

```javascript
node++;
```

## Performance



## Asyncronous I/O



## Deployment



## Libraries



## Conclusion



