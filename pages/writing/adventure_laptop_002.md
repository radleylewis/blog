📍Melbourne, Australia

# Lenovo T480: The Adventurer's (value) Laptop [Part 2]

###### 17 April 2021 | 971 words | 3-minute read

![Lenovo T480](/static/adventure_laptop_002.jpg)

_Total project cost came in at A$715 (approx. €450/ US$550)_

So it worked, and I'm drafting this up in Typora on a fresh Arch install on my battered T480. I'm extremely happy with the result, for just over A$700 I now have a dependable secondary machine that passes all of the criteria I outlined in Part 1 of this series. Specifically:

**Lightweight but durable**

The T480 I picked up came with a few cracks on the case, a damaged screen, a faulty touch-pad and various missing screws. But, everything works, and as I have come to expect from ThinkPad, the thing is built like a tank. The cracks were easily dealt with with some super glue, and I was able to source a screw set from AliExpress. The screen wasn't such a big deal either, as ThinkPad screens are usually notoriously rubbish and I had intended to upgrade it to a matte IPS panel anyway. The only thing that concerned me was the touchpad, but swapping it out for one I also sourced on AliExpress solved the issue. While the damage sounds bad, this machine has had a hard life - yet, most of the damage was superficial. In terms of durability, I give it a 9/10. On the weight side, while you couldn't say it's heavy, it definitely feels bulkier than the latest T Series ThinkPads, but overall forgivable and a marked improvement over the T440p.

**Powerful (relatively) with good battery life**

Emphasis on the _relatively_. Most of the work I do is on Linux, and with the exception of some video editing, my usual tasks aren't particularly computationally intensive. That being said I was slightly disappointed that the unit sports a Kaby-Lake Intel Code i5 8250u @ 1.60GHz. Not because this is a particularly bad processor - the 8th Gen Intel CPUs were a huge improvement over the prior generation - but because T480s also shipped with a slightly more performant i5 8350u. It's often pointed out that older ThinkPads like the T440p are often (almost) just as powerful as more recent units like the T480 when upgraded. While it's true that the socketed CPUs in the older machines does give them a bump, the 8th Gen CPUs exhibit a massive power efficiency improvement. Based on usage so far the unit gets at least 8 hours of steady use out of one charge and the batteries in the unit are relatively healthy. This machine came with integrated graphics which I was happy about as the GPU that shipped on some units was entry level in any case and would drain the battery more than anything. T480 models support up to 64GB of DDR4 RAM, but right now I am running 16GB and this more than covers my usage. If I end up running QubesOS like Edward Snowden I may need to upgrade, but for a lightweight Linux distribution like Arch, and considering the nature of my usage, right now 16GB is sufficient. Overall, powerful enough and with excellent battery life.

**Upgradeable**

Other than the socketed CPUs, there is still a fair bit of upgradeability to these units. In the end I fitted it with the following parts:

[2 x 8GB 2666MHz DDR4 Kingston HyperX Ram](https://www.amazon.com.au/gp/product/B0722Q3243/ref=ppx_yo_dt_b_asin_title_o05_s00?ie=UTF8&psc=1) = A$122

[mBeat Gorilla Travel Charger](https://www.amazon.com.au/gp/product/B078PW24RQ/ref=ppx_yo_dt_b_asin_title_o04_s00?ie=UTF8&psc=1) = A$66

[Samsung 500GB 860 EVO 2.5 SATA III](https://www.amazon.com.au/500GB-SSD-860-EVO-SATA/dp/B079FL9YQ6/ref=sr_1_4?dchild=1&keywords=samsung+sata&qid=1618621799&s=computers&sr=1-4) = A$89

[Arctic Silver Thermal Paste](https://www.amazon.com.au/Arctic-Silver-High-Density-AS5-3-5G-Compound/dp/B0087X728K/ref=sr_1_1?crid=35Z62SQYHB8NJ&dchild=1&keywords=artic+silver+thermal+paste&qid=1618627233&sprefix=artic+silver+the%2Caps%2C360&sr=8-1) = A$10

[Trackpad](https://www.aliexpress.com/item/4000388336308.html?spm=a2g0s.9042311.0.0.60de4c4d8RZJQp) = A$34

[Harddrive Caddy](https://www.aliexpress.com/item/1005001949307182.html?spm=a2g0s.9042311.0.0.60de4c4d8RZJQp) = A$7

[ThinkPad Screws](https://trade.aliexpress.com/orderList.htm?spm=a2g0o.home.1000001.31.650c2145HN2dzG&tracelog=ws_topbar) = A$12

[FHD IPS Panel](https://www.aliexpress.com/item/4001153042037.html?spm=a2g0s.9042311.0.0.60de4c4d8RZJQp) = A$125

T480 ThinkPad Laptop = A$250 (originally A$300 but I got A$50 back once I sold some old parts)

Total = A$715

It's actually possible to fit the T480 with an NVMe SSD using an M.2 adaptor. That being said, you won't see the maximum possible performance from the drive given the T480 only offers two PCIe lanes. Given that I only had a 2.5 inch SATA III drive lying around, I decided to opt for this, but keep in mind it is possible to run either. As previously mentioned, the panel was damaged, but this was an essential upgrade regardless.

> NOTE: _An astute reader might have noticed the CH341a chip reader in the photo. [Wolfgang's Channel](https://www.youtube.com/watch?v=ce7kqUEccUM) does a nice video on reading off the BIOS chip, if you want to do that for any reason whatsoever. You'll be able to find this on Amazon for around A$10._

**Good Value**

OK, so was it worth it? For less than €500 this machine outperforms the vast majority of consumer grade business laptops you'd find at your local department store but with a far nicer keyboard. It runs Arch Linux with almost no configuration and with the screen, RAM and Hard Drive upgrades becomes a quality machine for coding and productivity tasks. It's built well, and given ThinkPad designs have remained pretty consistent for years now, still looks relatively modern. Overall, this is a great laptop and I would highly recommend as a second machine or as a project for those wanting to play around and learn about tech.

### What's next?

The machine still needs a WWAN card and the CPU needs to be undervolted. But, more interestingly perhaps, I have been looking closely at security focused operating systems like [QubesOS](https://www.qubes-os.org/) recently and will likely try an install at some point. Stay tuned.
