local SPEED_MULTIPLIER = 5

function makePlayer(x, y)
    local player = {
        x = x,
        y = y,
        v_x = 0,
        v_y = 0,
        image = playerImage 
    }

    player.c_x = player.x + 4
    player.c_x2 = player.c_x + 9
    player.c_y = player.y + 20
    player.c_y2 = player.c_y + 6

    player.draw = function()
        if player.v_x == 0 and player.v_y == 1 then
            love.graphics.draw(boostImage, player.x + 25, player.y - 5, math.rad(90))
        end

        if player.v_x == 1 and player.v_y == 0 then
            love.graphics.draw(boostImage, player.x - 20, player.y)
        end

        if player.v_x == -1 and player.v_y == 0 then
            love.graphics.draw(boostImage, player.x + 40, player.y, 0, -1, 1)
        end

        if player.v_x > 0 then
            love.graphics.draw(player.image, player.x, player.y)
        else
            love.graphics.draw(player.image, player.x + 20, player.y, 0, -1, 1)
        end

        if player.v_x == 0 and player.v_y == -1 then
            love.graphics.draw(boostImage, player.x - 4, player.y + 40, math.rad(-90))
        end
    end

    player.move = function(dt)
        player.x = player.x + player.v_x * dt * SPEED_MULTIPLIER
        player.y = player.y + player.v_y * dt * SPEED_MULTIPLIER
        player.c_x = player.x + 4
        player.c_x2 = player.c_x + 9
        player.c_y = player.y + 20
        player.c_y2 = player.c_y + 6
    end

    player.setDirection = function(enemy)
        local dx = player.x - enemy.x
        local dy = player.y - enemy.y

        if dx > 16 then
            player.v_x = -1
        elseif dx < 16 then
            player.v_x = 1
        else
            player.v_x = 0
        end

        if dy > 16 then
            player.v_y = -1
        elseif dy < 16 then
            player.v_y = 1
        else
            player.v_y = 0
        end
    end

    player.bounce = function()
        player.v_x = player.v_x * -1
        player.v_y = player.v_y * -1
    end

    return player
end
