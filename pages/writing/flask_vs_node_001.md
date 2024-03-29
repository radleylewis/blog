📍Melbourne, Australia

###### 30th May 2021

###### 2265 words / 6 minute read

<img style="min-width: 100%;" alt="Flask vs Node.js" src="/static/flask_vs_node_001.png" />

# Flask vs Node.js

For more than two years now I have been using Node.js for almost all of the backend servers I have built. The vast majority of these were using Express.js, although I did play around with Koa.js towards the beginning, and even made a brief foray into bare Node.js as part of the [bootcamp](https://codeworks.me/) I participated in. Node.js has one distinct advantage which is that being a JavaScript runtime environment on the server, it allows for the use of a single language up and down the stack, meaning that developers can - in theory - seamlessly switch between sections of a project. With frameworks like React.Native now enabling JavaScript development for mobile devices, it is _theoretically_ possible to build an entire application exclusively in one language.

After 18 months working with React.Native I have serious reservations about it, and implore anyone looking to the framework as the silver bullet to consider the potential pitfalls - a whole different topic. Node.js on the other hand is far more mature, and to be fair, it has allowed me to build a variety of applications with notable success. But the first language I learned wasn't JavaScript, it was Python. I imagine this is quite common, as Python appears to have a sexier reputation amongst non-engineers, for the most part due to its association with data science, academia, fin-tech and the fact many people I'd worked with in banking had, at one point or another, written a few lines of Python. Although I am far more proficient in JavaScript than in Python, I often think about building applications in the latter. I built one application with [Django and React.js](https://www.saga47swan.com), which I found too bloated and opinionated for my liking. Recently, the opportunity arose to build an app with the Flask web framework. These are my thoughts on how Flask and Python compare to Node.js.

### Set Starting Positions

```
flask = 0
```

```
let node = 0;
```

_Note: I will use the terms Python and Flask interchangeably within this article, as I will also do in the case of Node and JavaScript. Of course in a pure sense, we aren't comparing apples to apples here, Node.js is a runtime environment whereas Flask is a web micro-framework. A more accurate comparison might be Express.js vs Flask. But the same conclusions ultimately apply, and so I have opted with Node.js vs Flask with Python for the sake of simplicity._

### Single Language Across the Stack

For a long time I really didn't see how having JavaScript in both the back and Front-End was all that valuable. With time I have concluded that it is an advantage, albeit not a huge one. My thinking was essentially that, having hired and managed teams of engineers, my experience tells me, that unless its a tiny start-up with less than a couple of engineers, the team ends up specialising anyway, at least to some extent in a specific part of the project. The concept of the _Production Possibilities Frontier_ in economics it quite applicable to the fields of software engineering in this case. The chart below demonstrates how a _Front-End Engineer_ and a _Back-end Engineer_ can achieve a total productivity increase through specialisation. While this example is highly simplistic, in tech, as with in business and management [Occam's Razor](https://en.wikipedia.org/wiki/Occam%27s_razor)
usually holds.

<img style="min-width: 100%;" alt="Production Possibilities Frontier - Front-End Engineer vs. Back-End Engineer" src="/static/ppf_001.png" />

_Lets say that the Orange line represents a front-end specialised engineer who can achieve a maximum possible output of 100 units of value through specialisation in front-end tasks. However, if that same engineer switches into the back-end, they can achieve only 30 units of value. The situation - which applies equally, but inversely, to the white line, which represents a back-end engineer - also indicates that any combination of balance between back-end and front-end work still results in a productive output that is less than the maximum._

Of course, there are other factors outside of pure productivity, such as learning, exposure to new technologies and code that would improve motivation. But experience tells me that the moment you have more than a single engineer working on a project, it is highly probable that the optimal output and project execution speed and quality will be achieved through some degree of specialisation. So the argument becomes less that the developer can shift across the project and more that the developer can understand the code in other parts of it. This is true, but it is also true that the shift from JavaScript to Python is not a tremendous one, and that any engineer worth their salt should be at least able to handle that gap, although this theory wouldn't be quite so true in the case of a shift from JavaScript to C++ or Java for example. Nevertheless, while the technology most appropriate to the task should be chosen - where practical -, Python is not an option in the browser while JavaScript does run on the server. This simple truth means Node takes a point.

```
node++;
```

### Syntax

JavaScript's syntax has grown on me with time, and, despite the language's strangeness in many aspects, is not always visually that dissimilar to other languages like Java (especially when using TypeScript). Python on the other hand is famed for its simple syntax that _reads like English_. Even now, having come to appreciate JavaScript's flexibility and quirks, I still prefer the way Python reads, including the use significant white space. The easier it is to express your thoughts in code the better, because, it allows for greater concentration on the actual conceptual problem rather than on the implementation. If you haven't seen a piece of code before, then Python's syntax will make understanding that code easier, assuming that you have an equally sound understanding of each language (and that the code is clean!). It is for this reason that I can understand Python's success in non-IT fields such as finance and economics where those employing the language are themselves not programmers, and see a language as a tool or a means to an ends. While JavaScript's evolution leaves it feeling more modern, it is still less beautiful in my opinion, and far more difficult for a beginner to grasp too (Many people will argue that JavaScript is an easy language, and they are right, it is easy to get started with, but it has many nooks and crannies, much like the other Lingua Franca, English, that can be awfully simple, but equally, near on impossible to master. Couple this with JavaScripts vast ecosystem of libraries and frameworks and I respectfully disagree that it is an extremely easy - or _toy_ - language).

```
python += 1
```

### Types

It is possible to use types in Python (known as hints), but when it comes to the successful implementation of types more broadly, JavaScript (well TypeScript obviously) wins hands down. In fact even the army of JavaScript haters are likely to concede that TypeScript has been transformative for the JavaScript ecosystem. Not only does TypeScript drastically improve the development experience from the standpoint of the engineer, it also promotes better structures and practices and more often than not leads to a cleaner, more well structured and better maintained code base. For myself personally, learning TypeScript was a watershed moment, and addressed many of the frustrations that I had with JavaScript. The first time I built a module using TypeScript, it worked the first time I ran it. Anyone with experience writing JavaScript will be all too aware of how significant this is.

One frustration I did have with TypeScript & Node.js was the time taken to transpile into JavaScript. There is a detailed [post](https://stackoverflow.com/questions/53428120/deno-vs-ts-node-whats-the-difference) on StackOverflow which does a good job comparing TypeScript with Node to Deno - which started 32x times faster in the simple speed test the author presented. I haven't verified this speed increase when it comes to Deno vs Node, although it isn't surprising. When using hints in Python however, this step is skipped entirely as the types live within the code at runtime. This may well result in a slight performance decrease, but it makes for a better development experience.

The growing prevalence of TypeScript also builds upon the aforementioned advantage of using the _single language across the stack_ advantage. Specifically through the sharing of common types. Type declarations on the front and back-end of the project and can easily be modularised and imported into each respective repository. This definitely results not only in less time spent coding the same features, but also promotes consistency across the project. While Python's type hinting is likely to improve as well as gain more traction over time, the advantage of reusable types in the front-end is something it can't deliver.

```
node++;
```

### Performance

I often hear comparisons between the _speed_ of languages. The fact of the matter is however, that in the vast majority of practical cases of implementation, speed of development - that is how fast the project can be delivered - trumps the speed of the application. No doubt that in large companies such as Google and Netflix, with hundreds of millions of users and insane volumes of data, speed does count. But in that case both languages are more likely to be used to interface with modules written in lower level, pure compiled languages. The beauty of both Node.js and Python is that if performance is paramount, then logic that is computational heavy can be written in C++ through the use of addons in the case of the former and C/C++ extensions in the case of the latter. In the case of Python, this can also mean circumvention of the dreaded Global Interpreter Lock. Nobody can debate that C/C++ will outperform either of these scripting languages.

> _"Python where we can, C++ where we must"_ - Early days at Google

So went the mantra (there is a StackOverflow post on the matter [here](https://stackoverflow.com/questions/2560310/heavy-usage-of-python-at-google/2561008#2561008)). Even today, JavaScript is not, of course, the only option, with Web Assembly offering promise in delivering massive speed gains in the browser. However, it is also undeniable that Chrome's V8 Engine (upon which Node.js runs) is blazingly fast. Consistent tweaks mean that JavaScript today is far more performant than it was at its inception. At the same time, Python is infamous for its lack of speed. _Before anyone loses it at me, recall my comments above, in 9 out of 10 cases speed of development is more important than the speed of the language!_. Both of these languages are single threaded (no necessarily I know, but for the sake of this article, and the vast majority of implementations, this is the case).

However, the fact that Python itself is in most cases slower than JavaScript is further underpinned in the specific context of I/O and asynchronous programming, which is where Node.js shines. Of course Python offers the built in asyncio from version 3.5 onwards, but this is at the very core of what Node.js is and how it works under the hood rather than an additional weapon in the armoury. Of course not all applications are I/O driven, but in the case they are Node.js clearly outperforms Python (and therefore the Flask framework). Overall, Node.js will outperform Python although there is ongoing work in the Python community to change this, including recent [statements](https://www.zdnet.com/article/python-programming-we-want-to-make-the-language-twice-as-fast-says-its-creator/) by the language's creator to that effect.

```TypeScript
node++;
```

### Packages & Package Managers

I have already mentioned Deno, and Ryan Dahl's [regrets](https://www.youtube.com/watch?v=M3BM9TB-8yA) about Node.js are no secret. I would highly recommend viewing his presentation on the matter. One of his specific points relates to what in effect was his _mandating_ of NPM. Specifically, his regret that there is a centralised repository for modules. For those interested about the Kik npm scandal, there is a great post [here](https://qz.com/646467/how-one-programmer-broke-the-internet-by-deleting-a-tiny-piece-of-code/) that goes into detail on that incident, but which also broadly encapsulates parts of the issue that Ryan Dahl speaks about. Python's pip sometimes feels less modern, but I trust it more - I can't tell you why, it just feels more reliable. Asides from this however, Python and Node.js both have massive community support and a vast set of libraries and packages. Python is stronger when it comes to data science and machine learning, but there are areas that Node.js does well too. Both take a point.

```
node++;
```

```
flask += 1
```

### Conclusion

Drum roll... and the winner is? Node.js (according to the points system!)

```
console.log(`Node.js Total Points: ${node}`);
```

```
Node.js Total Points: 4
```

```
print(f'Flask Total Points: {flask}')
```

```
Flask Total Points: 2
```

So on a points basis Node.js beats Flask out. This is however, a drastically simplistic look at both technologies, and doesn't take into account specific use cases, or working with the technology best suited to the project, team or otherwise. There are cases where Flask and Python are far more stable than Node.js. Everyone has their preference after all. I also haven't weighted the categories, whereas in reality, I value code readability and maintainability over some incremental pickup in performance. Python is also more fun, and writing quick scripts is a painless experience. In conclusion, Node.js is an extremely powerful JavaScript runtime environment, while Flask is a beautiful, minimalistic web framework. Both have their place, and I would implore you to try them both out. For now, I will continue to use both, but am also likely to take a closer look at Deno.

That's all folks.
