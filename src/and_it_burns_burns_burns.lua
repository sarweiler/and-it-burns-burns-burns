-- and it burns burns burns
-- 256 byte intro
-- released at get ready for lovebyte, 2023-01-14
-- 8th place in the new talent compo
-- cybørt jan 2023


-- set the palette
for i=0,47 do
    poke(16320+i,math.sin(i)^2*i*6)
end

-- clear the screen
cls()
t=0

function TIC()
    p={}
    -- draw the circles
    for i=0,3 do
        circb(
            120+math.sin(1.5*i+t*2)*50,
            90+math.sin(1.5*i+t)*15,
            10,
            15
            )
    end

    -- calculate the next state for each pixel
    for y=0,135 do
        for x=0,239,2 do
            a=math.atan2(68-y,120-x)
            c=pix(x,y)

            if c>0 then
                -- ... and save it in a table
                table.insert(p,{
                   x=x+(a>=0 and a/3.14 or -a/3.14)+math.random(-1,1),
                   y=y+(a>=0 and -a/3.14 or -a/3.14)+math.random(-1,1),
                   c=c+math.random(-1,0)
               })
            end
        end
    end

    -- draw the pixels
    for i=1,#p do
        circb(p[i].x,p[i].y,1,p[i].c)
    end

    -- increase time
    t=t+.02
end