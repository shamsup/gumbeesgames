sfxListener();

function sfxListener()
{	
	_root.punch = new Sound();
	_root.punch.attachSound("slice");
	_root.punch2 = new Sound();
	_root.punch2.attachSound("slice2");
	_root.kick = new Sound();
	_root.kick.attachSound("kick");
	_root.hit = new Sound();
	_root.hit.attachSound("hit");
	_root.clash = new Sound();
	_root.clash.attachSound("clash");
	 _root.whip = new Sound();
	_root.whip.attachSound("whip");
	_root.splash = new Sound();
	_root.splash.attachSound("splash");
	 _root.smoke = new Sound();
	_root.smoke.attachSound("smoke");
	_root.woosh = new Sound();
	_root.woosh.attachSound("woosh");
	_root.goon_die = new Sound();
	_root.goon_die.attachSound("goon_die");
	_root.goon_die_stab = new Sound();
	_root.goon_die_stab.attachSound("goon_die_stab");
	_root.m_hurt = new Sound();
	_root.m_hurt.attachSound("m_hurt");
	 _root.m_hurt.onSoundComplete = function ()
    {
        _root.m_hurt_sound = false;
    };
	_root.coin_flink = new Sound();
	_root.coin_flink.attachSound("coin_flink");
	_root.duck_sound = new Sound();
	_root.duck_sound.attachSound("duck_sound");
	_root.bonus_sound = new Sound();
	_root.bonus_sound.attachSound("bonusscratch");
	_root.scratch_half = new Sound();
	_root.scratch_half.attachSound("scratch_half");
	_root.run_sound = new Sound();
	 _root.run_sound.attachSound("shoes_loud");
	 _root.run_sound.onSoundComplete = function ()
    {
        _root.running_sound = false;
    };
	 //_root.attachMovie("gameMovie","cs1Target",_root.getNextHighestDepth());
	 //_root.cs1Target._x = -40.0;
	// _root.cs1Target._y = -1000;
	 cs1Listener();
}
_root.debug = false;
_root.coins = 0;
_root.hitCount = 0;
_root.running_sound = false;
_root.water_run_sound = new Sound();
_root.water_run_sound.attachSound("watersteps");
_root.water_run_sound.onSoundComplete = function ()
{
    _root.running_sound = false;
};
_root.beep = new Sound();
_root.beep.attachSound("beep");
_global.volumeLevel = new Sound();
_global.volumeLevel.setVolume(100);
_root.muteSounds = false;

function cs1Listener()
{
	_root.createEmptyMovieClip("firstbgmTarget",_root.getNextHighestDepth());
	firstbgmTarget.attachMovie("sc7","sc7",this.getNextHighestDepth());
}
fbgmListener();
function fbgmListener()
{
	_root.createEmptyMovieClip("bgmTarget",_root.getNextHighestDepth());
}
bgmListener();
function bgmListener()
{
	//_root.attachMovie("gameMovie2","cs2Target",_root.getNextHighestDepth());
	//_root.cs2Target._x = -40.0
	//_root.cs2Target._y = -1000;
}
cs2Listener();
function cs2Listener()
{
	//_root.attachMovie("gameMovie3","cs3Target",_root.getNextHighestDepth());
	//_root.cs3Target._x = -40.0
	//_root.cs3Target._y = -1000;
}
cs3Listener();
function cs3Listener()
{
	//_root.attachMovie("gameMovie4","cs4Target",_root.getNextHighestDepth());
	//_root.cs4Target._x = -40.0;
	//_root.cs4Target._y = -1000;
}
cs4Listener();
function cs4Listener()
{
	_root.attachMovie("cs_win","cswinTarget",_root.getNextHighestDepth());
	_root.cswinTarget._x = -80.0;
	_root.cswinTarget._y = -1000;
}


cswinListener();
function cswinListener()
{
	_root.attachMovie("cscMovie","cscTarget",_root.getNextHighestDepth());
	_root.cscTarget._x = -40;
	_root.cscTarget._y = -1000;
}
cscListener();
function cscListener()
{
	_root.attachMovie("cs_go","csgoTarget", _root.getNextHighestDepth());
	_root.csgoTarget._x = -40;
	_root.csgoTarget._y = -1000;
}

/*csgoListener();
function csgoListener()
{
	_root.attachMovie("Level1_end","cs1_endTarget",_root.getNextHighestDepth());
	_root.cs1_endTarget._x = -40.0
	_root.cs1_endTarget._y = -1000;
	_root.cs1_endTarget._visible = false;
}
cs1_endListener();
function cs1_endListener()
{
	_root.attachMovie("Level2_end","cs2_endTarget",_root.getNextHighestDepth());
	_root.cs2_endTarget._x = -40.0;
	_root.cs2_endTarget._y = -1000;
	_root.cs2_endTarget._visible = false;
}
cs2_endListener();
function cs2_endListener()
{
	_root.attachMovie("Level3_end","cs3_endTarget",_root.getNextHighestDepth());
	_root.cs3_endTarget._x = -40.0;
	_root.cs3_endTarget._y = -1000;
	_root.cs3_endTarget._visible = false;
}*/

_root.debug = false;
_root.coins = 0;
_root.hitCount = 0;
_root.running_sound = false;
_root.water_run_sound = new Sound();
_root.water_run_sound.attachSound("watersteps");
_root.water_run_sound.onSoundComplete = function ()
{
    _root.running_sound = false;
};
_root.beep = new Sound();
_root.beep.attachSound("beep");
_global.volumeLevel = new Sound();
_global.volumeLevel.setVolume(100);
_root.muteSounds = false;
_global.checkGround = function (character, height, loop)
{
    if (loop < 12)
    {
        ++loop;
        if (_root.game.level.ground.hitTest(character._x + _root.game._x, character._y + height + _root.game._y, true))
        {
            character._y = character._y - 1;
            _root.playerDy = 0;
            if (_root.game.level.ground.hitTest(character._x + _root.game._x, character._y + height + _root.game._y, true))
            {
                _global.checkGround(character, height, loop);
            } // end if
            return (true);
        }
        else if (_root.onPlatform)
        {
            return (true);
        }
        else
        {
            return (false);
        } // end else if
    } // end else if
};
_global.checkGround_boss = function (character, height, loop)
{
    if (loop < 12)
    {
        ++loop;
        if (_root.game.level.ground.hitTest(character._x + _root.game._x, character._y + height + _root.game._y, true))
        {
            character._y = character._y - 1;
            character.dy = 0;
            if (_root.game.level.ground.hitTest(character._x + _root.game._x, character._y + height + _root.game._y, true))
            {
                _global.checkGround_boss(character, height, loop);
            } // end if
            return (true);
        }
        else
        {
            return (false);
        } // end if
    } // end else if
};
_global.checkCeiling = function (character, height, loop)
{
    if (loop < 12)
    {
        ++loop;
        if (_root.game.level.ground.hitTest(character._x + _root.game._x, character._y - height + _root.game._y, true) && !_root.game.level.ground.hitTest(character._x + _root.game._x, character._y + height + _root.game._y, true))
        {
            character._y = character._y + 1;
            _root.playerDy = 0;
            if (_root.game.level.ground.hitTest(character._x + _root.game._x, character._y - height + _root.game._y, true))
            {
                _global.checkCeiling(character, height, loop);
            } // end if
            return (true);
        }
        else
        {
            return (false);
        } // end if
    } // end else if
};
_global.checkEdge = function (character, height, dx)
{
    if (_root.game.level.ground.hitTest(character._x + _root.game._x + dx, character._y + height + _root.game._y, true))
    {
        return (true);
    }
    else
    {
        return (false);
    } // end else if
};
_global.checkEdge_boss = function (character, height, dx)
{
    if (_root.game.level.ground.hitTest(character._x + _root.game._x + dx, character._y + height + _root.game._y, false))
    {
        if (character._name == "boss")
        {
        } // end if
        return (true);
    }
    else
    {
        if (character._name == "boss")
        {
        } // end if
        return (false);
    } // end else if
};
_global.checkWall = function (character, height, dx)
{
    if (_root.game.level.ground.hitTest(character._x + _root.game._x + dx, character._y + height / 2 + _root.game._y, true))
    {
        return (true);
    }
    else
    {
        return (false);
    } // end else if
};
_global.checkWallatt = function (character, height, dx)
{
    if (_root.game.level.ground.hitTest(character._x + _root.game._x + dx, character._y + height / 2 + _root.game._y, true))
    {
        return (true);
    }
    else
    {
        return (false);
    } // end else if
};
_global.checkPlayer = function (character, dir, offset)
{
    if (offset == undefined)
    {
        offset = 0;
    } // end if
    if (_root.game.player.hitTest(character._x + _root.game._x + _root.playerWidth * dir + _root.playerDx, character._y + _root.game._y + offset, false))
    {
        return (true);
    }
    else
    {
        return (false);
    } // end else if
};
_global.checkPlayer_tengu = function (character, dir, offset)
{
    if (offset == undefined)
    {
        offset = 0;
    } // end if
    if (_root.game.player.hitTest(character._x + _root.game._x + _root.playerWidth * dir + _root.playerDx, character._y + _root.game._y + offset, true))
    {
        return (true);
    }
    else
    {
        return (false);
    } // end else if
};
_global.checkPlayer_boss = function (character, dir, offset)
{
    dir = dir * -1;
    if (offset == undefined)
    {
        offset = 0;
    } // end if
    if (_root.game.player.hitTest(character))
    {
        return (true);
    }
    else
    {
        return (false);
    } // end else if
};
_global.radiansToDegrees = function (radians)
{
    degrees = int(radians * 5.729578E+001);
    if (degrees < 0)
    {
        degrees = degrees + 360;
    } // end if
    return (degrees);
};
_global.degreesToRadians = function (degrees)
{
    radians = degrees * 1.745329E-002;
    return (radians);
};
_global.followPlayer = function ()
{
    this._x = _root.game.player._x;
    this._y = _root.game.player._y;
};
_global.cameraLogic = function ()
{
    ++_root.frameCount;
    if (_root.frameCount > 15 && !_root.fpsSet)
    {
        this.tick = getTimer() - this.lastTime;
        _root.FPS = int(1 / this.tick * 1000 * _root.frameCount);
        _root.frameCount = 0;
        this.lastTime = getTimer();
    } 
    bgDiff = this.bg._x + this._x;
    if (bgDiff > 0)
    {
        this.bg._x = this.bg._x - this.bg._width / 2;
    }
    else if (bgDiff < -this.bg._width / 2)
    {
        this.bg._x = this.bg._x + this.bg._width / 2;
    } 
    if (_root.playerDir > 0)
    {
        targetX = 125;
    }
    else
    {
        targetX = 475;
    } 
    targetY = 300;
    playerPositionX = _root.game.player._x + this._x;
    playerPositionY = _root.game.player._y + this._y;
    if (_root.game.player._x > _root.camMin && _root.game.player._x < _root.camMax)
    {
        _root.cameraMoving = true;
        if (Math.abs(playerPositionX - targetX) > 4)
        {
            ease = int((playerPositionX - targetX) / 5);
            this._x = this._x - ease;
            this.bg._x = this.bg._x + ease / 2;
            this.bg2._x = this.bg2._x + ease / 3;
            this.fg._x = this.fg._x - ease / 2;
        }
    }
    else
    {
        _root.cameraMoving = false;
    }
    if (_root.playerJumping)
    {
        this._y = (_root.camHeight - this.player._y) / _root.camJump;
        this.bg._y = (this.player._y / 2 - _root.camHeight / 1.500000E+000) / _root.camJump - _root.camOffset - 40;
        this.bg2._y = (this.player._y / 4 - _root.camHeight / 1.500000E+000) / _root.camJump - _root.camOffset + 300;
    }
    else if (Math.abs(this._y + this.player._y - 150) > 1)
    {
        this._y = this._y + int(((_root.camHeight - this.player._y) / _root.camJump - this._y) / 4);
    }
};
_global.cameraLogic2 = function ()
{
    ++_root.frameCount;
    if (_root.frameCount > 15 && !_root.fpsSet)
    {
        this.tick = getTimer() - this.lastTime;
        _root.FPS = int(1 / this.tick * 1000 * _root.frameCount);
        _root.frameCount = 0;
        this.lastTime = getTimer();
    } // end if
    if (!_root.onPlatform)
    {
        if (_root.playerDir > 0)
        {
            targetX = 125;
        }
        else
        {
            targetX = 475;
        } // end else if
    }
    else if (_root.gotoLast == "level2a" || _root.gotoLast == "level2b")
    {
        targetX = 300 + (_root.game.player._x - _root.currentPlatform._x);
    }
    else if (_root.playerDir > 0)
    {
        targetX = 175;
    }
    else
    {
        targetX = 425;
    } // end else if
    targetY = 300;
    playerPositionX = _root.game.player._x + this._x;
    playerPositionY = _root.game.player._y + this._y;
    if (_root.game.player._x > _root.camMin && _root.game.player._x < _root.camMax)
    {
        _root.cameraMoving = true;
        if (Math.abs(playerPositionX - targetX) > 4)
        {
            ease = int((playerPositionX - targetX) / 5);
            this._x = this._x - ease;
            _root.bg._x = _root.bg._x - ease / 25;
            _root.bgScroll = _root.bgScroll + ease / 2;
        } // end if
        if (Math.abs(playerPositionY - targetY) > 4)
        {
        } // end if
    }
    else
    {
        _root.cameraMoving = false;
    } // end else if
    if (_root.playerJumping)
    {
        this._y = _root.camHeight - this.player._y;
    }
    else
    {
        this._y = _root.camHeight - this.player._y;
    } // end else if
};
_global.cameraLogic3 = function ()
{
    ++_root.frameCount;
    if (_root.frameCount > 15 && !_root.fpsSet)
    {
        this.tick = getTimer() - this.lastTime;
        _root.FPS = int(1 / this.tick * 1000 * _root.frameCount);
        _root.frameCount = 0;
        this.lastTime = getTimer();
    } // end if
    if (_root.playerDir > 0)
    {
        if (_root.runCounter > 0)
        {
            var _loc5 = 125;
        }
        else
        {
            _loc5 = 125;
        } // end else if
    }
    else if (_root.runCounter > 0)
    {
        _loc5 = 475;
    }
    else
    {
        _loc5 = 475;
    } // end else if
    var _loc4 = _root.game.player._x;
    if (_loc4 < 4375)
    {
        _root.camMin = -50;
        _root.camMax = 4170;
        _root.camHeight = -285;
        if (_root.game.door1._currentframe == 2)
        {
            _root.game.door1.gotoAndStop(1);
            this._x = this._x + 200;
            _global.snowStop();
        }
        else
        {
            _root.game.door2.gotoAndStop(2);
        } // end else if
    }
    else if (_loc4 < 6308)
    {
        _root.camMin = 4600;
        _root.camMax = 6100;
        _root.camHeight = -500;
        if (_root.game.door1._currentframe == 1)
        {
            _root.game.door1.gotoAndStop(2);
            this._x = this._x - 200;
            _global.snowStart();
        } // end if
        if (_root.game.door2._currentframe == 1)
        {
            _root.game.door2.gotoAndStop(2);
            this._x = this._x + 300;
            _global.snowStart();
        } // end if
    }
    else if (_loc4 < 10915)
    {
        _root.camMin = 6580;
        _root.camMax = 10700;
        _root.camHeight = -470;
        if (_root.game.door2._currentframe == 2)
        {
            _root.game.door2.gotoAndStop(1);
            this._x = this._x - 300;
            _global.snowStop();
        } // end if
        if (_root.game.door3._currentframe == 2)
        {
            _root.game.door3.gotoAndStop(1);
            this._x = this._x + 300;
            _global.snowStop();
        } // end if
    }
    else if (_loc4 < 12850)
    {
        _root.camMin = 11115;
        _root.camMax = 12600;
        _root.camHeight = -650;
        if (_root.game.door3._currentframe == 1)
        {
            _root.game.door3.gotoAndStop(2);
            this._x = this._x - 300;
            _global.snowStart();
        } // end if
        if (_root.game.door4._currentframe == 1)
        {
            _root.game.door4.gotoAndStop(2);
            this._x = this._x + 300;
            _global.snowStart();
        } // end if
    }
    else
    {
        _root.camMin = 13000;
        _root.camMax = 14110;
        _root.camHeight = -600;
        if (_root.playerDir > 0)
        {
            _loc5 = 175;
        }
        else
        {
            _loc5 = 425;
        } // end else if
        if (_root.game.door4._currentframe == 2)
        {
            _root.game.door4.gotoAndStop(1);
            this._x = this._x - 300;
            _global.snowStop();
        } // end else if
    } // end else if
    var _loc6 = _loc4 + this._x;
    var _loc8 = _root.game.player._y + this._y;
    if (_loc4 > _root.camMin && _loc4 < _root.camMax)
    {
        _root.cameraMoving = true;
        if (Math.abs(_loc6 - _loc5) > 4)
        {
            var _loc7 = int((_loc6 - _loc5) / 5);
            this._x = this._x - _loc7;
            _root.bgScroll = _root.bgScroll + _loc7 / 2;
        } // end if
    }
    else
    {
        _root.cameraMoving = false;
    } // end else if
    if (_root.playerJumping)
    {
        this._y = (_root.camHeight - this.player._y) / _root.camJump;
    }
    else if (Math.abs(this._y + this.player._y - 150) > 1)
    {
        this._y = this._y + int(((_root.camHeight - this.player._y) / _root.camJump + _root.camOffset - this._y) / 4);
    } // end else if
};
_global.cameraLogic4 = function ()
{
    ++_root.frameCount;
    if (_root.frameCount > 15 && !_root.fpsSet)
    {
        this.tick = getTimer() - this.lastTime;
        _root.FPS = int(1 / this.tick * 1000 * _root.frameCount);
        _root.frameCount = 0;
        this.lastTime = getTimer();
    } // end if
    if (_root.playerDir > 0)
    {
        if (_root.runCounter > 0)
        {
            var _loc6 = 125;
        }
        else
        {
            _loc6 = 125;
        } // end else if
    }
    else if (_root.runCounter > 0)
    {
        _loc6 = 475;
    }
    else
    {
        _loc6 = 475;
    } // end else if
    var _loc3 = _root.game.player._x;
    var _loc4 = _loc3 + this._x;
    var _loc7 = _root.game.player._y + this._y;
    if (_loc3 > _root.camMin && _loc3 < _root.camMax)
    {
        _root.cameraMoving = true;
        if (Math.abs(_loc4 - _loc6) > 4)
        {
            var _loc5 = int((_loc4 - _loc6) / 5);
            this._x = this._x - _loc5;
            _root.bgScroll = _root.bgScroll + _loc5 / 2;
        } // end if
    }
    else
    {
        _root.cameraMoving = false;
    } // end else if
    if (_root.playerJumping)
    {
        this._y = (_root.camHeight - this.player._y) / _root.camJump;
    }
    else if (Math.abs(this._y + this.player._y - 150) > 1)
    {
        this._y = this._y + int(((_root.camHeight - this.player._y) / _root.camJump + _root.camOffset - this._y) / 4);
    } // end else if
};
_global.cameraLogic5 = function ()
{
    ++_root.frameCount;
    if (_root.frameCount > 15 && !_root.fpsSet)
    {
        this.tick = getTimer() - this.lastTime;
        _root.FPS = int(1 / this.tick * 1000 * _root.frameCount);
        _root.frameCount = 0;
        this.lastTime = getTimer();
    } // end if
    if (_root.playerDir > 0)
    {
        if (_root.runCounter > 0)
        {
            var _loc8 = 125;
        }
        else
        {
            _loc8 = 125;
        } // end else if
    }
    else if (_root.runCounter > 0)
    {
        _loc8 = 475;
    }
    else
    {
        _loc8 = 475;
    } // end else if
    var _loc7 = 225;
    var _loc4 = _root.game.player._x;
    var _loc6 = _loc4 + this._x;
    var _loc5 = _root.game.player._y + this._y;
    if (_loc4 > _root.camMin && _loc4 < _root.camMax)
    {
        _root.cameraMoving = true;
        if (Math.abs(_loc6 - _loc8) > 4)
        {
            var _loc3 = int((_loc6 - _loc8) / 5);
            this._x = this._x - _loc3;
            _root.bgScroll = _root.bgScroll + _loc3 / 2;
        } // end if
    }
    else
    {
        _root.cameraMoving = false;
    } // end else if
    if (_root.playerJumping)
    {
        _loc3 = int((_loc5 - _loc7) / 6);
        this._y = this._y - _loc3;
    }
    else if (Math.abs(this._y + this.player._y - 150) > 1)
    {
        _loc3 = int((_loc5 - _loc7) / 2);
        this._y = this._y - _loc3;
    } // end else if
};
_global.playerLogic = function ()
{
   for (var _loc4 = 0; _loc4 < _root.bitmapMemory.length; ++_loc4)
    {
        if (_root.bitmapMemory[_loc4][1] < this._x + _root.portalMax && _root.bitmapMemory[_loc4][1] > this._x - _root.portalMin)
        {
            _root.bitmapMemory[_loc4][0].cacheAsBitmap = true;
            _root.bitmapMemory[_loc4][0]._visible = true;
            continue;
        } 
        _root.bitmapMemory[_loc4][0]._visible = false;
        _root.bitmapMemory[_loc4][0].cacheAsBitmap = false;
    } 
    if (_root.playerState == "stand")
    {
        if (!Key.isDown(90))
        {
            _root.key_z = false;
        } 
        if (!Key.isDown(88))
        {
            _root.key_x = false;
        } 
        if (!Key.isDown(67))
        {
            _root.key_c = false;
        } 
        this.attackTime = 1.000000E+010;
        _root.playerAttacking = false;
        if ((_root.showSplash || _root.showSplash2) && _root.game.player._y > 0)
        {
        } 
    }
    else if (_root.playerState == "run" || _root.playerState == "jump" || _root.playerState == "land" || _root.playerState == "duck" || _root.playerState == "stillducking" || _root.playerState == "standingup" || _root.playerState == "fall")
    {
        if (!Key.isDown(90))
        {
            _root.key_z = false;
        } 
        if (!Key.isDown(88))
        {
            _root.key_x = false;
        } 
        if (!Key.isDown(67))
        {
            _root.key_c = false;
        } 
        
    } 
    if (_root.playerState != "stand")
    {
    } 
    ++_root.comboCounter;
    if (_root.playerHealth > 0)
    {
        _root.HUD.sword.health.gotoAndStop(100 - _root.playerHealth + 1);
        this.dieCount = 0;
    } 
    if (_root.playerHealth <= 0)
    {
        _root.playerState = "die";
        if (this.dieCount > 36)
        {
            if (!dead)
            {
                dead = true;
                if (_root.lives > 0)
                {
                    --_root.lives;
                    if (_root.lives > 4)
                    {
                        _root.HUD.livesBar.gotoAndStop(5);
                    }
                    else
                    {
                        _root.HUD.livesBar.gotoAndStop(_root.lives + 1);
                    } 
                    _root.playerHealth = 0;
                    _root.gotoNext = "continue";
                }
                else
                {
                    _root.gotoLast = "start";
                    _root.gotoNext = "gameover";
                } 
                if (_root.levelNum == "level2")
                {
                    _global.snowStop();
                }
                else if (_root.levelNum == "level3")
                {
                    _global.stopFog();
                }
                else if (_root.levelNum == "level4")
                {
                    _global.rainStop();
                } 
                _root.fadeout.play();
            } 
        }
        else
        {
            ++this.dieCount;
        } 
    }
    else
    {
        dead = false;
        if (_root.playerInvincible)
        {
            ++myflash;
            if (myflash % 4 < 2)
            {
                //this._visible = true;
            }
            else
            {
				//trace("ÉÁ¹â");
                //this._visible = false;
            } 
            if (myflash > 30)
            {
                //this._visible = true;
                _root.playerInvincible = false
            } ;
			
        }
        else
        {
            myflash = 0;
        } 
    } 
    if (this._xscale > 0 && _root.playerDir < 0)
    {
        this._xscale = -this._xscale;
        _root.game.combo._alpha = 0;
        _root.score = _root.score + _root.hitCount * 10;
        _root.hitCount = 0;
        _root.comboMeter = false;
    }
   else if (this._xscale < 0 && _root.playerDir > 0)
    {
        this._xscale = -this._xscale;
        _root.score = _root.score + _root.hitCount * 10;
        _root.hitCount = 0;
        _root.comboMeter = false;
    } 
    this.gotoAndStop(_root.playerState);
    if (_root.playerState != "run")
    {
        _root.runCounter = 0;
        if (_root.showSplash || _root.showSplash2)
        {
            if (_root.water_run_sound.position > 0)
            {
                _root.water_run_sound.stop("watersteps");
                _root.running_sound = false;
            } 
        }
        else if (_root.run_sound.position > 0)
        {
            _root.run_sound.stop("shoes_loud");
            _root.running_sound = false;
        }
        _root.game.runsplash.removeMovieClip();
        _root.game.runsplash2.removeMovieClip();
    }
    else
    {
        ++_root.runCounter;
    }
    if (!_global.checkWall(this, _root.playerHeight, _root.playerDx))
    {
        if (_root.gotoNext == "level2intro")
        {
            if (_root.game.boss_holder.boss.state != "waiting")
            {
                if (this._x + _root.playerDx < 17250)
                {
                }
                else
                {
                    this._x = this._x + _root.playerDx;
                }
            }
            else
            {
                this._x = this._x + _root.playerDx;
            }
        }
        else
        {
            this._x = this._x + _root.playerDx;
        }
    }
    this._y = this._y + _root.playerDy;
	//trace(this._y);
   if (_root.platforming)
    {
        if (!_global.checkGround(this, _root.playerHeight, 0) && !_global.checkGround(this, _root.playerHeight * 1.300000E+000, 0))
        {
            _root.playerDy = _root.playerDy + _root.gravity;
            if ((_root.playerState == "run" || _root.playerState == "walk" || _root.playerState == "stand") && _root.playerDy > 24)
            {
                _root.playerJumping = true;
                _root.playerState = "fall";
            }
            if (_root.playerJumping && _root.playerDy > 5 && _root.playerState != "jumpkick" && _root.playerState != "jumppunch" && _root.playerState != "vert_jumppunch")
            {
                _root.playerState = "fall";
                _root.gravity = _root.globalGravity;
            }
        }
        else if (_root.playerJumping)
        {
            _root.playerJumping = false;
            if (_root.playerDx != 0)
            {
                _root.playerState = "land";
            }
            else
            {
                _root.playerState = "standingup";
            }
            walkCount = 12;
            _root.playerDx = 0;
            _root.playerDy = 0;
            _root.gravity = _root.globalGravity;
        }
    }
    else if (!_global.checkGround(this, _root.playerHeight, 0))
    {
        _root.playerDy = _root.playerDy + _root.gravity;
        if ((_root.playerState == "run" || _root.playerState == "walk" || _root.playerState == "stand") && _root.playerDy > 24)
        {
            _root.playerJumping = true;
            _root.playerState = "fall";
        }
        if (_root.playerJumping && _root.playerDy > 5 && _root.playerState != "jumpkick" && _root.playerState != "jumppunch" && _root.playerState != "vert_jumppunch")
        {
            _root.playerState = "fall";
            _root.gravity = _root.globalGravity;
        }
    }
    else if (_root.playerJumping)
    {
        _root.playerJumping = false;
        if (_root.playerDx != 0)
        {
            _root.playerState = "land";
        }
        else
        {
            _root.playerState = "standingup";
        }
        walkCount = 12;
        _root.playerDx = 0;
        _root.playerDy = 0;
        _root.gravity = _root.globalGravity;
    }
    if (_root.playerState != "duck" && _root.playerState != "stillducking")
    {
        if (!_root.playerJumping && (_root.playerState == "walk" || _root.playerState == "run" || _root.playerState == "duck" || _root.playerState == "up" || _root.playerState == "die"))
        {
            _root.playerState = "stand";
            _root.playerAttacking = false;
        }
    }
    else if (_root.playerState == "stillducking")
    {
        if (Key.isDown(40))
        {
            _root.playerState = "stillducking";
        }
        else
        {
            _root.playerState = "standingup";
        }
    }
    else
    {
        _root.playerState = "standingup";
        _root.playerAttacking = false;
    }
   if (_root.playerState != "highpunch" && _root.playerState != "vert_highpunch" && _root.playerState != "highkick" && _root.playerState != "capespin")
    {
        _root.playerDx = 0;
    }
    if (_root.playerState == "capespin")
    {
        ++_root.superComboCount;
        if (_root.superComboCount > 14)
        {
            _root.playerDx = 0;
        }
    }
    if (_root.playerState == "highpunch" || _root.playerState == "vert_highpunch")
    {
        _root.playerDx = _root.playerDir * 2;
    }
    else if (_root.playerState == "highkick")
    {
        _root.playerDx = _root.playerDir * 5;
    }
    else if (_root.playerState == "hurt")
    {
        _root.playerDx = -_root.playerDir * 4;
    }
    else if (_root.playerState == "hurt2")
    {
        _root.playerDx = _root.playerDir * 4;
    }
    if (_root.playerHealth > 0)
    {
        if (!_root.isPaused && _root.playerState != "electro" && _root.playerState != "hurt" && _root.playerState != "hurt2" && _root.playerState != "capespin")
        {
            if (Key.isDown(40))
            {
                if (!_root.key_z && !_root.key_x && !_root.key_c)
                {
                    if (!_root.playerJumping && _root.playerState != "vert_punch" && _root.playerState != "vert_jumppunch" && _root.playerState != "vert_lowpunch" && _root.playerState != "lowkick" && _root.playerState != "lowpunch")
                    {
                        if (_root.playerState == "stillducking")
                        {
                        }
                        else
                        {
                            if (!this.duckSound && _root.playerDx == 0 && _root.playerState != "duck" && _root.playerState != "stillducking" && _root.playerState != "standingup" && _root.playerState != "run")
                            {
                                _root.duck_sound.start();
                                this.duckSound = true;
                            }
                            _root.playerState = "duck";
                        }
                    }
                }
            }
            else
            {
                this.duckSound = false;
            }
            if (Key.isDown(37) && !Key.isDown(39))
            {
                this.duckSound = true;
                if (_root.playerState != "punch" && _root.playerState != "lowpunch" && _root.playerState != "highpunch" && _root.playerState != "lowkick" && _root.playerState != "highkick" && _root.playerState != "vert_punch" && _root.playerState != "vert_lowpunch" && _root.playerState != "vert_highpunch")
                {
                    if (!_root.playerJumping && _root.playerState != "kick" && _root.playerState != "jumppunch" && _root.playerState != "vert_jumppunch")
                    {
                        _root.playerState = "run";
                        _root.playerWalkSpeed = 6;
                        if ((_root.showSplash || _root.showSplash2) && _root.game.player._y > 100)
                        {
                            if (!_root.running_sound)
                            {
                                _root.water_run_sound.start();
                                _root.running_sound = true;
                            }
                            _root.game.runsplash.removeMovieClip();
                            _root.playerDx = -_root.playerSpeed + 4;
                            _root.game.runSpawn2.duplicateMovieClip("runsplash2", _root.game.getNextHighestDepth());
                            _root.game.runsplash2._x = _root.game.player._x + 15;
                            _root.game.runsplash2._y = _root.game.player._y - 40;
                        }
                        else
                        {
                            if (!_root.running_sound)
                            {
                                _root.run_sound.start();
                                _root.running_sound = true;
                            }
                            _root.playerDx = -_root.playerSpeed;
                            _root.game.runsplash2.removeMovieClip();
                        }
                    }
                    else if (_root.playerState == "kick" || _root.playerState == "capespin")
                    {
                        _root.playerDx = -_root.playerSpeed / 2;
                        _root.playerWalkSpeed = 6;
                    }
                    else if (_root.playerState == "highkick")
                    {
                        _root.playerDx = -_root.playerSpeed / 4;
                        _root.playerWalkSpeed = 6;
                    }
                    else if (_root.playerState == "jumppunch" || _root.playerState == "vert_jumppunch")
                    {
                        _root.playerDx = -_root.playerSpeed / 1.400000E+000;
                        _root.playerWalkSpeed = 6;
                    }
                    else
                    {
                        _root.playerDx = -_root.playerSpeed;
                        _root.playerWalkSpeed = 6;
                    }
                    _root.playerDir = -1;
                }
            }
            if (Key.isDown(39) && !Key.isDown(37))
            {
                this.duckSound = true;
                if (_root.playerState != "vert_punch" && _root.playerState != "vert_lowpunch" && _root.playerState != "vert_highpunch" && _root.playerState != "punch" && _root.playerState != "lowpunch" && _root.playerState != "highpunch" && _root.playerState != "lowkick" && _root.playerState != "highkick")
                {
                    if (!_root.playerJumping && _root.playerState != "kick" && _root.playerState != "jumppunch" && _root.playerState != "vert_jumppunch")
                    {
                        _root.playerState = "run";
                        _root.playerWalkSpeed = 6;
                        if ((_root.showSplash || _root.showSplash2) && _root.game.player._y > 100)
                        {
                            if (!_root.running_sound)
                            {
                                _root.water_run_sound.start();
                                _root.running_sound = true;
                            }
                            _root.playerDx = _root.playerSpeed - 4;
                            _root.game.runsplash2.removeMovieClip();
                            _root.game.runSpawn.duplicateMovieClip("runsplash", _root.game.getNextHighestDepth());
                            _root.game.runsplash._x = _root.game.player._x - 15;
                            _root.game.runsplash._y = _root.game.player._y - 40;
                        }
                        else
                        {
                            if (!_root.running_sound)
                            {
                                _root.run_sound.start();
                                _root.running_sound = true;
                            }
                            _root.playerDx = _root.playerSpeed;
                            _root.game.runsplash.removeMovieClip();
                        }
                    }
                    else if (_root.playerState == "kick")
                    {
                        _root.playerDx = _root.playerSpeed / 2;
                        _root.playerWalkSpeed = 6;
                    }
                    else if (_root.playerState == "highkick")
                    {
                        _root.playerDx = -_root.playerSpeed / 4;
                        _root.playerWalkSpeed = 6;
                    }
                    else if (_root.playerState == "jumppunch" || _root.playerState == "vert_jumppunch")
                    {
                        _root.playerDx = _root.playerSpeed / 1.400000E+000;
                        _root.playerWalkSpeed = 6;
                    }
                    else
                    {
                        _root.playerDx = _root.playerSpeed;
                        _root.playerWalkSpeed = 6;
                    }
                    _root.playerDir = 1;
                }
            }
            if (!Key.isDown(39) && !Key.isDown(37))
            {
                walkCount = 0;
                _root.playerWalkSpeed = 6;
            }
            if (Key.isDown(67))
            {
                if (!_root.key_c)
                {
                    _root.superCombo = true;
                }
                if (!_root.key_z && !_root.key_x && !_root.key_c)
                {
                    _root.key_c = true;
                    _root.camDelay = 0;
                    _root.playerWalkSpeed = 6;
                    if (_root.playerJumping)
                    {
                        if (_root.playerDy > -32)
                        {
                            _root.playerState = "jumpkick";
                        }
                    }
                    else if (_root.runCounter > 4 || (Key.isDown(39) || Key.isDown(37)) && Key.isDown(38))
                    {
                        _root.playerState = "capespin";
                        _root.superCombo = true;
                        _root.superComboCount = 0;
                        _root.runCounter = 0;
                    }
                    else if (Key.isDown(38))
                    {
                        _root.playerState = "highkick";
                    }
                    else if (Key.isDown(40))
                    {
                        _root.playerState = "lowkick";
                    }
                    else
                    {
                        _root.playerState = "kick";
                    }
                    this.attackTime = getTimer();
                    _root.playerAttacking = true;
                    walkCount = 0;
                }
                
            }
            if (Key.isDown(88))
            {
                if (!_root.key_x)
                {
                    _root.ultraCombo = true;
                }
                if (!_root.key_z && !_root.key_x && !_root.key_c)
                {
                    _root.key_x = true;
                    _root.camDelay = 0;
                    _root.playerWalkSpeed = 6;
                    if (_root.playerJumping)
                    {
                        _root.playerState = "jumppunch";
                    }
                    else if (_root.playerState == "run" && _root.runCounter > 12)
                    {
                        _root.playerJumping = true;
                        _root.playerDy = -25;
                        _root.gravity = _root.globalGravity;
                        _root.playerState = "jumppunch";
                    }
                    else if (Key.isDown(38))
                    {
                        _root.playerState = "highpunch";
                    }
                    else if (Key.isDown(40))
                    {
                        _root.playerState = "lowpunch";
                    }
                    else
                    {
                        _root.playerState = "punch";
                        _root.ultraCombo = true;
                    }
                    this.attackTime = getTimer();
                    if (this.attackTime >= 999999999)
                    {
                        _root.zen.play();
                    }
                    _root.playerAttacking = true;
                    walkCount = 0;
                }
                
            }
            if (Key.isDown(90))
            {
                if (!_root.key_z)
                {
                    _root.ultraCombo = true;
                }
                if (!_root.key_z && !_root.key_x && !_root.key_c)
                {
                    _root.key_z = true;
                    _root.camDelay = 0;
                    _root.playerWalkSpeed = 6;
                    if (_root.playerJumping)
                    {
                        _root.playerState = "vert_jumppunch";
                    }
                    else if (_root.playerState == "run" && _root.runCounter > 12)
                    {
                        _root.playerJumping = true;
                        _root.playerDy = -25;
                        _root.gravity = _root.globalGravity;
                        _root.playerState = "vert_jumppunch";
                    }
                    else if (Key.isDown(38))
                    {
                        _root.playerState = "vert_highpunch";
                    }
                    else if (Key.isDown(40))
                    {
                        _root.playerState = "vert_lowpunch";
                    }
                    else
                    {
                        _root.playerState = "vert_punch";
                        _root.ultraCombo = true;
                    }
                    this.attackTime = getTimer();
                    _root.playerAttacking = true;
                    walkCount = 0;
                }
                
            }
            if (Key.isDown(32))
            {
                if (!_root.key_space)
                {
                    _root.key_space = true;
                    if (!_root.playerJumping)
                    {
                        _root.playerJumping = true;
                        _root.playerAttacking = false;
                        _root.playerState = "jump";
                        _root.playerDy = -52;
                        _root.gravity = _root.globalGravity;
                        walkCount = 12;
                    }
                }
            }
            else
            {
                _root.key_space = false;
            }
            if (Key.isDown(83))
            {
                if (!key_s)
                {
                    _global.cheat = "S";
                    key_s = true;
                }
            }
            else
            {
                key_s = false;
            }
            if (Key.isDown(85))
            {
                if (!key_u)
                {
                    _global.cheat = _global.cheat + "U";
                    key_u = true;
                }
            }
            else
            {
                key_u = false;
            }
            if (Key.isDown(78))
            {
                if (!key_n)
                {
                    _global.cheat = _global.cheat + "N";
                    key_n = true;
                }
            }
            else
            {
                key_n = false;
            }
            if (Key.isDown(70))
            {
                if (!key_f)
                {
                    _global.cheat = _global.cheat + "F";
                    key_f = true;
                }
            }
            else
            {
                key_f = false;
            }
            if (Key.isDown(76))
            {
                if (!key_l)
                {
                    _global.cheat = _global.cheat + "L";
                    key_l = true;
                }
            }
            else
            {
                key_l = false;
            }
            if (Key.isDown(79))
            {
                if (!key_o)
                {
                    _global.cheat = _global.cheat + "O";
                    key_o = true;
                }
            }
            else
            {
                key_o = false;
            }
            if (Key.isDown(87))
            {
                if (!key_w)
                {
                    _global.cheat = _global.cheat + "W";
                    key_w = true;
                }
            }
            else
            {
                key_w = false;
            }
            if (Key.isDown(69))
            {
                if (!key_e)
                {
                    _global.cheat = _global.cheat + "E";
                    key_e = true;
                }
            }
            else
            {
                key_e = false;
            }
            if (Key.isDown(82))
            {
                if (!key_r)
                {
                    if (_global.cheat == "SUNFLOWE")
                    {
                        _root.playerHealth = 100;
                        _root.bonus_sound.start();
                    }
                    key_r = true;
                }
            }
            else
            {
                key_r = false;
            }
        }
        else if (Key.isDown(67))
        {
            if (!_root.key_c)
            {
                _root.key_c = true;
                _root.superCombo = true;
            }
        }
        else
        {
            _root.key_c = false;
        }
    }
};
_global.tenguAI = function ()
{
    this.gotoAndStop(this.state);
    if (this.range < 200)
    {
    } // end if
    if (this.health > 0)
    {
        if (this.invincibleCounter > 0)
        {
            if (this.invincibleCounter % 4 > 2)
            {
                this._visible = false;
            }
            else
            {
                this._visible = true;
            } // end else if
            this.invincibleCounter = this.invincibleCounter + 3;
        } // end if
        if (this.invincibleCounter > 12)
        {
            this.invincible = false;
            this.invincibleCounter = 0;
            this._visible = true;
        } // end if
        this.range = Math.abs(this._parent._x - _root.game.player._x);
        this.rangey = Math.abs(this._parent._y - _root.game.player._y);
        if ((this.range > 400 || this.range > 700 && this.state == "retreat") && this.rangey < 120)
        {
            if (this._parent._x > _root.game.player._x)
            {
                this._parent.dir = -1;
            }
            else if (this._parent._x < _root.game.player._x)
            {
                this._parent.dir = 1;
            } // end if
        } // end else if
        if (this.range < 280 + random(40) && this.range > 50)
        {
            if ((this._parent._x > _root.game.player._x && this._parent.dir == -1 || this._parent._x < _root.game.player._x && this._parent.dir == 1) && this.attackCount > 10 && this.state != "attack" && this.state != "jump" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "fall")
            {
                if (this.range < 240)
                {
                    this.state = "attack";
                    this.attackTime = getTimer();
                    this.sfxCount = 0;
                }
                else
                {
                    if (this._parent._y > 200 && random(2) == 0)
                    {
                        if (!_global.checkWallatt(this._parent, -50, 300 * this._parent.dir))
                        {
                            this.state = "jump";
                            this.sfxCount = 0;
                        } // end if
                    }
                    else
                    {
                        this.state = "attack";
                        this.attackTime = getTimer();
                        this.sfxCount = 0;
                    } // end else if
                    this.attackTime = getTimer();
                } // end else if
                this.attackCount = 0;
            } // end if
        }
        else if (this.range < 50 && this.rangey < 200)
        {
            if (this.state == "walk")
            {
                this.state = "retreat";
            } // end if
        }
        else if (this.range < 240 - random(20) && this.rangey < 200)
        {
            if (this.attackCount > 10 && this.state != "attack" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "stun")
            {
                this.state = "attack";
                this.attackTime = getTimer();
                this.attackCount = 0;
                this.sfxCount = 0;
            }
            else
            {
                ++this.attackCount;
            } // end else if
        } // end else if
        this._parent._xscale = this._parent.dir * Math.abs(this._parent._xscale);
        if (this.state == "idle")
        {
            if (this.range < 400 && this.rangey < 200)
            {
                this.state = "stand";
            } // end if
        }
        else if (this.state == "stand")
        {
            if (this.range < 350)
            {
                this.state = "walk";
            } // end if
            ++this.attackCount;
        }
        else if (this.state == "walk")
        {
            if (!_global.checkWall(this._parent, -50, this.speed * 2 * this._parent.dir) && _global.checkEdge(this._parent, 50, this.speed * 2 * this._parent.dir * 5))
            {
                this._parent._x = this._parent._x + this.speed * this._parent.dir;
            }
            else
            {
                this._parent.dir = this._parent.dir * -1;
            } // end else if
            ++this.attackCount;
        }
        else if (this.state == "retreat")
        {
            if (!_global.checkWall(this._parent, -50, this.speed * this._parent.dir) && _global.checkEdge(this._parent, 50, this.speed * this._parent.dir * 5))
            {
                this._parent._x = this._parent._x + this.speed * this._parent.dir;
            }
            else
            {
                this._parent.dir = this._parent.dir * -1;
            } // end else if
            ++this.attackCount;
            if (this.range < 250 && this.range < 150 && random(6) == 0)
            {
                if (this._parent._x > _root.game.player._x)
                {
                    this._parent.dir = -1;
                }
                else if (this._parent._x < _root.game.player._x)
                {
                    this._parent.dir = 1;
                } // end else if
                this.state = "attack";
                this.attackTime = getTimer();
                this.attackCount = 0;
                this.sfxCount = 0;
            } // end if
        }
        else if (this.state == "hurt" || this.state == "hurt_blood")
        {
            if (!_global.checkWall(this._parent, -50, -6 * this._parent.dir))
            {
                this._parent._x = this._parent._x - 5 * this._parent.dir;
            } // end if
        }
        else if (this.state == "stun")
        {
            ++this.stunCount;
            if (this.stunCount > 9)
            {
                this.stunCount = 0;
                _root.hitCount = 0;
                this.state = "hurt_blood";
            } // end if
        }
        else if (this.state == "attack")
        {
            if (this.sfxCount > 6)
            {
                _root.woosh.start();
                this.sfxCount = -6;
            }
            else
            {
                ++this.sfxCount;
            } // end else if
        }
        else if (this.state == "jump")
        {
            if (this.sfxCount > 8)
            {
                _root.woosh.start();
                this.sfxCount = -6;
            }
            else
            {
                ++this.sfxCount;
            } // end else if
        } // end else if
        if (this.attack.spear_tip.hitTest(_root.game.player.hitChecker) || this.jump.attack.spear_tip.hitTest(_root.game.player.hitChecker))
        {
            if (_root.playerState != "hurt" && _root.playerState != "hurt2" && _root.playerState != "hurt3" && !_root.playerInvincible && this.attackTime < _root.game.player.attackTime)
            {
                if (!_root.m_hurt_sound)
                {
                    _root.m_hurt.start();
                    _root.m_hurt_sound = true;
                } // end if
                if (!_root.playerJumping)
                {
                    if (this._parent._x > _root.game.player._x && _root.playerDir == 1 || this._parent._x < _root.game.player._x && _root.playerDir == -1)
                    {
                        _root.playerState = "hurt";
                    }
                    else
                    {
                        _root.playerState = "hurt2";
                    } // end else if
                }
                else
                {
                    _root.playerState = "hurt3";
                } // end else if
                _root.playerHealth = _root.playerHealth - this.strength;
                _root.playerInvincible = true;
            } // end if
        } // end if
        if (_global.checkPlayer(this._parent, this._parent.dir, 0) || _global.checkPlayer(this._parent, this._parent.dir * -1, 0))
        {
            if (this.state == "attack" && this._parent.dir != _root.playerDir)
            {
                _root.playerDx = 0;
            } // end if
            if (_root.playerAttacking && this.attackTime >= _root.game.player.attackTime && this.state != "hurt" && this.state != "hurt_blood")
            {
                _root.playerDx = 0;
                if (_root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
                {
                    if (this.state != "stun" || this.stunCount > 6)
                    {
                        _root.kick.start();
                        this.health = this.health - 15;
                        this.state = "stun";
                        this.stunCount = 0;
                        fallCount = 0;
                        ++_root.hitCount;
                        _root.comboCount = 10;
                        if (_root.hitCount > 2)
                        {
                            _root.comboMeter = true;
                        } 
                        this.tengu.play();
                    }
                }
                if (_root.playerState == "highpunch" || _root.playerState == "lowpunch" || _root.playerState == "punch" || _root.playerState == "jumppunch")
                {
                    if (this.state != "stun" || this.stunCount > 6)
                    {
                        _root.kick.start();
                        this.health = this.health - 18;
                        this.state = "stun";
                        this.stunCount = 0;
                        fallCount = 0;
                        ++_root.hitCount;
                        _root.comboCount = 10;
                        if (_root.hitCount > 2)
                        {
                            _root.comboMeter = true;
                        }
                        this.tengu.play();
                        if (this._parent._x > _root.game.player._x)
                        {
                            this._parent.dir = -1;
                        }
                        else if (this._parent._x < _root.game.player._x)
                        {
                            this._parent.dir = 1;
                        }
                    }
                }
                else if (_root.playerState == "vert_highpunch" || _root.playerState == "vert_lowpunch" || _root.playerState == "vert_punch" || _root.playerState == "vert_jumppunch" || _root.playerState == "capespin")
                {
                    if (this.state != "stun" || this.stunCount > 6)
                    {
                        this.state = "stun";
                        this.stunCount = 0;
                        _root.kick.start();
                        this.health = this.health - 22;
                        fallCount = 0;
                        ++_root.hitCount;
                        _root.comboCount = 10;
                        if (_root.hitCount > 2)
                        {
                            _root.comboMeter = true;
                        }
                        this.tengu.play();
                        if (this._parent._x > _root.game.player._x)
                        {
                            this._parent.dir = -1;
                        }
                        else if (this._parent._x < _root.game.player._x)
                        {
                            this._parent.dir = 1;
                        }
                    }
                }
                else if (_root.playerState == "capespin")
                {
                    if (this.state != "stun" || this.stunCount > 6)
                    {
                        _root.kick.start();
                        this.health = this.health - 18;
                        this.state = "stun";
                        this.stunCount = 0;
                        fallCount = 0;
                        ++_root.hitCount;
                        _root.comboCount = 10;
                        if (_root.hitCount > 2)
                        {
                            _root.comboMeter = true;
                        }
                        this.tengu.play();
                        if (this._parent._x > _root.game.player._x)
                        {
                            this._parent.dir = -1;
                        }
                        else if (this._parent._x < _root.game.player._x)
                        {
                            this._parent.dir = 1;
                        }
                    }
                }
                if (this.health <= 0)
                {
                    _root.score = _root.score + 100;
                    this.state = "die";
                    this._visible = true;
                }
            }
        }
    }
    else
    {
        if (!this.flash)
        {
            this.flash = 1;
            if (_root.playerState == "capespin" || _root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
            {
                _root.goon_die.start();
            }
            else
            {
                _root.goon_die_stab.start();
            }
            this.state = "die";
        }
        else
        {
            ++this.flash;
        }
        if (this.flash > 30)
        {
            if (this.flash % 5 < 2)
            {
                this._visible = false;
            }
            else
            {
                this._visible = true;
            }
        }
        if (this.flash > 100)
        {
            this._visible = false;
            ++_root.eKills;
            delete this.onEnterFrame;
        }
    }
};
_global.samuraiAI = function ()
{
    this.gotoAndStop(this.state);
    if (this.range < 400)
    {
    } // end if
    if (this.health > 0)
    {
        this.range = Math.abs(this._parent._x - _root.game.player._x);
        this.rangey = Math.abs(this._parent._y - _root.game.player._y);
        if (this.state != "retreat")
        {
            if (this.range > 125 + random(150) && this.rangey < 400)
            {
                if (this._parent._x > _root.game.player._x)
                {
                    this._parent.dir = -1;
                }
                else if (this._parent._x < _root.game.player._x)
                {
                    this._parent.dir = 1;
                } // end if
            } // end else if
        }
        else if (this.range > 25 + random(25) && this.rangey < 400)
        {
            if (this._parent._x > _root.game.player._x)
            {
                this._parent.dir = -1;
            }
            else if (this._parent._x < _root.game.player._x)
            {
                this._parent.dir = 1;
            } // end else if
        } // end else if
        if (this.range < 240 + random(40) && this.range > 75 + random(25))
        {
            if ((this._parent._x > _root.game.player._x && this._parent.dir == -1 || this._parent._x < _root.game.player._x && this._parent.dir == 1) && this.attackCount > 10 && this.state != "attack" && this.state != "hurt" && this.state != "hurt_blood")
            {
                if (this.range > 80 && this.state != "retreat")
                {
                    this.state = "attack";
                    this.attackTime = getTimer();
                    this.attackCount = 0;
                    _root.punch.start();
					trace("¹¥»÷");
                }
                else if (this.range > 160 + random(50) && this.state == "retreat")
                {
                    this.state = "attack";
                    this.attackTime = getTimer();
                    this.attackCount = 0;
                    _root.punch.start();
					trace("¹¥»÷2");
                } // end else if
                
            } // end if
        }
        else if (this.range < 80 - random(20) && this.rangey < 400)
        {
            if (this.state != "attack" && this.state != "retreat" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "stun" && this.state != "fall")
            {
                if (random(18) == 0)
                {
                    this.state = "retreat";
                } // end if
            } // end if
        } // end else if
        this._parent._xscale = this._parent.dir * Math.abs(this._parent._xscale);
        if (this.state == "idle")
        {
            if (this.range < 400 && this.rangey < 400)
            {
                this.state = "stand";
            } // end if
            ++this.attackCount;
        }
        else if (this.state == "stand")
        {
            if (this.range < 350)
            {
                this.state = "walk";
            } // end if
            ++this.attackCount;
        }
        else if (this.state == "walk")
        {
            if (!_global.checkWall(this._parent, -50, this.speed * this._parent.dir) && _global.checkEdge(this._parent, 50, this.speed * this._parent.dir * 5))
            {
                this._parent._x = this._parent._x + this.speed * this._parent.dir;
				//trace("22")
            } // end if
            ++this.attackCount;
        }
        else if (this.state == "retreat")
        {
            if (!_global.checkWall(this._parent, -50, this.speed * this._parent.dir) && _global.checkEdge(this._parent, 50, this.speed * this._parent.dir * 5))
            {
                this._parent._x = this._parent._x - this.speed * this._parent.dir;
            } // end if
            ++this.attackCount;
            if (this.range > 200 + random(50))
            {
                this.state = "walk";
            } // end if
        }
        else if (this.state == "hurt" || this.state == "hurt_blood")
        {
        }
        else if (this.state == "stun")
        {
            ++this.stunCount;
            if (this.stunCount > 9)
            {
                this.stunCount = 0;
                _root.hitCount = 0;
                this.state = "hurt_blood";
            } // end if
            
        } // end else if
        if (this.attack.spear_tip.hitTest(_root.game.player.hitChecker))
        {
            if (_root.playerState != "hurt" && _root.playerState != "hurt2" && _root.playerState != "hurt3" && !_root.playerInvincible && this.attackTime < _root.game.player.attackTime)
            {
                if (!_root.m_hurt_sound)
                {
                    _root.m_hurt.start();
                    _root.m_hurt_sound = true;
                } // end if
                if (!_root.playerJumping)
                {
                    if (this._parent._x > _root.game.player._x && _root.playerDir == 1 || this._parent._x < _root.game.player._x && _root.playerDir == -1)
                    {
                        _root.playerState = "hurt";
                    }
                    else
                    {
                        _root.playerState = "hurt2";
                    } // end else if
                }
                else
                {
                    _root.playerState = "hurt3";
                } // end else if
                _root.playerHealth = _root.playerHealth - this.strength;
                _root.playerInvincible = true;
            } // end if
        } // end if
        if (_global.checkPlayer(this._parent, this._parent.dir, -20) || _global.checkPlayer(this._parent, this._parent.dir, -120) || _global.checkPlayer(this._parent, this._parent.dir * -1, -20) || _global.checkPlayer(this._parent, this._parent.dir * -1, -120))
        {
            if (_root.playerAttacking && this.state != "hurt" && this.state != "hurt_blood")
            {
                _root.playerDx = 0;
                if (_root.playerAttacking && !this.invincible && this.attackTime >= _root.game.player.attackTime)
                {
                    if (_root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
                    {
                        if (this.state != "stun" || this.stunCount > 6)
                        {
                            _root.kick.start();
                            this.health = this.health - 15;
                            this.state = "stun";
                            this.stunCount = 0;
                            fallCount = 0;
                            ++_root.hitCount;
                            _root.comboCount = 10;
                            if (_root.hitCount > 2)
                            {
                                _root.comboMeter = true;
                            } // end if
                            this.samurai.play();
                        } // end if
                    } // end if
                    if (_root.playerState == "highpunch" || _root.playerState == "lowpunch" || _root.playerState == "punch" || _root.playerState == "jumppunch")
                    {
                        if (this.state != "stun" || this.stunCount > 6)
                        {
                            _root.kick.start();
                            this.health = this.health - 15;
                            this.state = "stun";
                            this.stunCount = 0;
                            fallCount = 0;
                            ++_root.hitCount;
                            _root.comboCount = 10;
                            if (_root.hitCount > 2)
                            {
                                _root.comboMeter = true;
                            } // end if
                            this.samurai.play();
                        } // end if
                    }
                    else if (_root.playerState == "vert_highpunch" || _root.playerState == "vert_lowpunch" || _root.playerState == "vert_punch" || _root.playerState == "vert_jumppunch")
                    {
                        if (this.state != "stun" || this.stunCount > 6)
                        {
                            _root.kick.start();
                            this.health = this.health - 15;
                            this.state = "stun";
                            this.stunCount = 0;
                            fallCount = 0;
                            ++_root.hitCount;
                            _root.comboCount = 10;
                            if (_root.hitCount > 2)
                            {
                                _root.comboMeter = true;
                            } // end if
                            this.samurai.play();
                        } // end if
                    }
                    else if (_root.playerState == "capespin")
                    {
                        if (this.state != "stun" || this.stunCount > 6)
                        {
                            _root.kick.start();
                            this.health = this.health - 15;
                            this.state = "stun";
                            this.stunCount = 0;
                            fallCount = 0;
                            ++_root.hitCount;
                            _root.comboCount = 10;
                            if (_root.hitCount > 2)
                            {
                                _root.comboMeter = true;
                            } // end if
                            this.samurai.play();
                        } // end if
                    } // end else if
                } // end else if
                if (this.health <= 0)
                {
                    _root.score = _root.score + 2500;
                    this.state = "die";
                } // end if
            }
            else if (this.state != "attack" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "stun" && this.state != "fall" && this.attackCount > 10)
            {
                
            } // end if
        } // end else if
    }
    else
    {
        if (!this.flash)
        {
            this.flash = 1;
            if (_root.playerState == "capespin" || _root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
            {
                _root.goon_die.start();
            }
            else
            {
                _root.goon_die_stab.start();
            } // end else if
            this.state = "die";
        }
        else
        {
            ++this.flash;
        } // end else if
        if (this.flash > 50)
        {
            if (this.flash % 4 < 2)
            {
                this._visible = false;
            }
            else
            {
                this._visible = true;
            } // end if
        } // end else if
        if (this.flash > 100)
        {
            this._visible = false;
            ++_root.eKills;
            delete this.onEnterFrame;
        } // end if
    } // end else if
};


_global.samuraiAIs = function ()
{
    this.gotoAndStop(this.state);
    if (this.range < 400)
    {
    } // end if
    if (this.health > 0)
    {
        this.range = Math.abs(this._parent._x - _root.game.player._x);
        this.rangey = Math.abs(this._parent._y - _root.game.player._y);
        if (this.state != "retreat")
        {
            if (this.range > 125 + random(150) && this.rangey < 400)
            {
                if (this._parent._x > _root.game.player._x)
                {
                    this._parent.dir = -1;
                }
                else if (this._parent._x < _root.game.player._x)
                {
                    this._parent.dir = 1;
                } // end if
            } // end else if
        }
        else if (this.range > 25 + random(25) && this.rangey < 400)
        {
            if (this._parent._x > _root.game.player._x)
            {
                this._parent.dir = -1;
            }
            else if (this._parent._x < _root.game.player._x)
            {
                this._parent.dir = 1;
            } // end else if
        } // end else if
        if (this.range < 240 + random(40) && this.range > 75 + random(25))
        {
            if ((this._parent._x > _root.game.player._x && this._parent.dir == -1 || this._parent._x < _root.game.player._x && this._parent.dir == 1) && this.attackCount > 10 && this.state != "attack" && this.state != "hurt" && this.state != "hurt_blood")
            {
                if (this.range > 80 && this.state != "retreat")
                {
                    this.state = "attack";
                    this.attackTime = getTimer();
                    this.attackCount = 0;
                    _root.punch.start();
					trace("¹¥»÷");
                }
                else if (this.range > 160 + random(50) && this.state == "retreat")
                {
                    this.state = "attack";
                    this.attackTime = getTimer();
                    this.attackCount = 0;
                    _root.punch.start();
					trace("¹¥»÷2");
                } // end else if
                
            } // end if
        }
        else if (this.range < 80 - random(20) && this.rangey < 400)
        {
            if (this.state != "attack" && this.state != "retreat" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "stun" && this.state != "fall")
            {
                if (random(18) == 0)
                {
                    this.state = "retreat";
                } // end if
            } // end if
        } // end else if
        this._parent._xscale = this._parent.dir * Math.abs(this._parent._xscale);
        if (this.state == "idle")
        {
            if (this.range < 400 && this.rangey < 400)
            {
                this.state = "stand";
            } // end if
            ++this.attackCount;
        }
        else if (this.state == "stand")
        {
            if (this.range < 350)
            {
                this.state = "walk";
            } // end if
            ++this.attackCount;
        }
        else if (this.state == "walk")
        {
            if (!_global.checkWall(this._parent, -50, this.speed * this._parent.dir) && _global.checkEdge(this._parent, 50, this.speed * this._parent.dir * 5))
            {
                this._parent._x = this._parent._x + this.speed * this._parent.dir;
				//trace("22")
            } // end if
            ++this.attackCount;
        }
        else if (this.state == "retreat")
        {
            if (!_global.checkWall(this._parent, -50, this.speed * this._parent.dir) && _global.checkEdge(this._parent, 50, this.speed * this._parent.dir * 5))
            {
                this._parent._x = this._parent._x - this.speed * this._parent.dir;
            } // end if
            ++this.attackCount;
            if (this.range > 200 + random(50))
            {
                this.state = "walk";
            } // end if
        }
        else if (this.state == "hurt" || this.state == "hurt_blood")
        {
        }
        else if (this.state == "stun")
        {
            ++this.stunCount;
            if (this.stunCount > 9)
            {
                this.stunCount = 0;
                _root.hitCount = 0;
                this.state = "hurt_blood";
            } // end if
            
        } // end else if
        if (this.attack.spear_tip.hitTest(_root.game.player.hitChecker))
        {
            if (_root.playerState != "hurt" && _root.playerState != "hurt2" && _root.playerState != "hurt3" && !_root.playerInvincible && this.attackTime < _root.game.player.attackTime)
            {
                if (!_root.m_hurt_sound)
                {
                    _root.m_hurt.start();
                    _root.m_hurt_sound = true;
                } // end if
                if (!_root.playerJumping)
                {
                    if (this._parent._x > _root.game.player._x && _root.playerDir == 1 || this._parent._x < _root.game.player._x && _root.playerDir == -1)
                    {
                        _root.playerState = "hurt";
                    }
                    else
                    {
                        _root.playerState = "hurt2";
                    } // end else if
                }
                else
                {
                    _root.playerState = "hurt3";
                } // end else if
                _root.playerHealth = _root.playerHealth - this.strength;
                _root.playerInvincible = true;
            } // end if
        } // end if
        if (_global.checkPlayer(this._parent, this._parent.dir, -20) || _global.checkPlayer(this._parent, this._parent.dir, -120) || _global.checkPlayer(this._parent, this._parent.dir * -1, -20) || _global.checkPlayer(this._parent, this._parent.dir * -1, -120))
        {
            if (_root.playerAttacking && this.state != "hurt" && this.state != "hurt_blood")
            {
                _root.playerDx = 0;
                if (_root.playerAttacking && !this.invincible && this.attackTime >= _root.game.player.attackTime)
                {
                    if (_root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
                    {
                        if (this.state != "stun" || this.stunCount > 6)
                        {
                            _root.kick.start();
                            this.health = this.health - 15;
                            this.state = "stun";
                            this.stunCount = 0;
                            fallCount = 0;
                            ++_root.hitCount;
                            _root.comboCount = 10;
                            if (_root.hitCount > 2)
                            {
                                _root.comboMeter = true;
                            } // end if
                            this.samurai.play();
                        } // end if
                    } // end if
                    if (_root.playerState == "highpunch" || _root.playerState == "lowpunch" || _root.playerState == "punch" || _root.playerState == "jumppunch")
                    {
                        if (this.state != "stun" || this.stunCount > 6)
                        {
                            _root.kick.start();
                            this.health = this.health - 15;
                            this.state = "stun";
                            this.stunCount = 0;
                            fallCount = 0;
                            ++_root.hitCount;
                            _root.comboCount = 10;
                            if (_root.hitCount > 2)
                            {
                                _root.comboMeter = true;
                            } // end if
                            this.samurai.play();
                        } // end if
                    }
                    else if (_root.playerState == "vert_highpunch" || _root.playerState == "vert_lowpunch" || _root.playerState == "vert_punch" || _root.playerState == "vert_jumppunch")
                    {
                        if (this.state != "stun" || this.stunCount > 6)
                        {
                            _root.kick.start();
                            this.health = this.health - 15;
                            this.state = "stun";
                            this.stunCount = 0;
                            fallCount = 0;
                            ++_root.hitCount;
                            _root.comboCount = 10;
                            if (_root.hitCount > 2)
                            {
                                _root.comboMeter = true;
                            } // end if
                            this.samurai.play();
                        } // end if
                    }
                    else if (_root.playerState == "capespin")
                    {
                        if (this.state != "stun" || this.stunCount > 6)
                        {
                            _root.kick.start();
                            this.health = this.health - 15;
                            this.state = "stun";
                            this.stunCount = 0;
                            fallCount = 0;
                            ++_root.hitCount;
                            _root.comboCount = 10;
                            if (_root.hitCount > 2)
                            {
                                _root.comboMeter = true;
                            } // end if
                            this.samurai.play();
                        } // end if
                    } // end else if
                } // end else if
                if (this.health <= 0)
                {
                    _root.score = _root.score + 2500;
                    this.state = "die";
                } // end if
            }
            else if (this.state != "attack" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "stun" && this.state != "fall" && this.attackCount > 10)
            {
                
            } // end if
        } // end else if
    }
    else
    {
        if (!this.flash)
        {
            this.flash = 1;
            if (_root.playerState == "capespin" || _root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
            {
                _root.goon_die.start();
            }
            else
            {
                _root.goon_die_stab.start();
            } // end else if
            this.state = "die";
        }
        else
        {
            ++this.flash;
        } // end else if
        if (this.flash > 50)
        {
            if (this.flash % 4 < 2)
            {
                this._visible = false;
            }
            else
            {
                this._visible = true;
            } // end if
        } // end else if
        if (this.flash > 100)
        {
            this._visible = false;
            ++_root.eKills;
            delete this.onEnterFrame;
        } // end if
    } // end else if
};













_global.samuraiAI2 = function ()
{
    this.gotoAndStop(this.state);
    if (this.range < 400)
    {
    } // end if
    if (this.health > 0)
    {
        if (this.rangey > 75 && this.state == "walk")
        {
            this.state = "stand";
        } // end if
        this.range = Math.abs(this._parent._x - _root.game.player._x);
        this.rangey = Math.abs(this._parent._y - _root.game.player._y);
        if (this.state != "retreat")
        {
            if (this.range > 125 + random(150) && this.rangey < 400)
            {
                if (this._parent._x > _root.game.player._x)
                {
                    this._parent.dir = -1;
                }
                else if (this._parent._x < _root.game.player._x)
                {
                    this._parent.dir = 1;
                } // end if
            } // end else if
        }
        else if (this.range > 25 + random(25) && this.rangey < 400)
        {
            if (this._parent._x > _root.game.player._x)
            {
                this._parent.dir = -1;
            }
            else if (this._parent._x < _root.game.player._x)
            {
                this._parent.dir = 1;
            } // end else if
        } // end else if
        if (this.range < 100 + random(40) && this.range > 50 + random(25))
        {
            if ((this._parent._x > _root.game.player._x && this._parent.dir == -1 || this._parent._x < _root.game.player._x && this._parent.dir == 1) && this.attackCount > 10 && this.state != "attack" && this.state != "hurt" && this.state != "hurt_blood")
            {
                if (this.range > 50 && this.state != "retreat")
                {
                    this.state = "attack";
                    this.attackTime = getTimer();
                    this.attackCount = 0;
                    _root.punch.start();
                }
                else if (this.range > 120 + random(50) && this.state == "retreat")
                {
                    this.state = "attack";
                    this.attackTime = getTimer();
                    this.attackCount = 0;
                    _root.punch.start();
                } // end else if
                
            } // end if
        }
        else if (this.range < 80 - random(20) && this.rangey < 400)
        {
            if (this.state != "attack" && this.state != "retreat" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "stun" && this.state != "fall")
            {
                if (random(18) == 0)
                {
                    this.state = "retreat";
                } // end if
            } // end if
        } // end else if
        this._parent._xscale = this._parent.dir * Math.abs(this._parent._xscale);
        if (this.state == "idle")
        {
            if (this.range < 400 && this.rangey < 400)
            {
                this.state = "stand";
            } // end if
            ++this.attackCount;
        }
        else if (this.state == "stand")
        {
            if (this.range < 350 + random(25) && this.rangey < 75)
            {
                this.state = "walk";
            } // end if
            ++this.attackCount;
        }
        else if (this.state == "walk")
        {
            if (!_global.checkWall(this._parent, -50, this.speed * this._parent.dir) && _global.checkEdge(this._parent, 50, this.speed * this._parent.dir * 5))
            {
                this._parent._x = this._parent._x + this.speed * this._parent.dir;
            } // end if
            ++this.attackCount;
        }
        else if (this.state == "retreat")
        {
            if (!_global.checkWall(this._parent, -50, this.speed * this._parent.dir) && _global.checkEdge(this._parent, 50, this.speed * this._parent.dir * 5))
            {
                this._parent._x = this._parent._x - this.speed * this._parent.dir;
            } // end if
            ++this.attackCount;
            if (this.range > 160 + random(90))
            {
                this.state = "walk";
            } // end if
        }
        else if (this.state == "hurt" || this.state == "hurt_blood")
        {
        }
        else if (this.state == "stun")
        {
            ++this.stunCount;
            if (this.stunCount > 8)
            {
                this.stunCount = 0;
                _root.hitCount = 0;
                this.state = "hurt_blood";
            } // end if
            
        } // end else if
        if (this.attack.spear_tip.hitTest(_root.game.player.hitChecker))
        {
            if (_root.playerState != "hurt" && _root.playerState != "hurt2" && _root.playerState != "hurt3" && !_root.playerInvincible && this.attackTime < _root.game.player.attackTime)
            {
                if (!_root.m_hurt_sound)
                {
                    _root.m_hurt.start();
                    _root.m_hurt_sound = true;
                } // end if
                if (!_root.playerJumping)
                {
                    if (this._parent._x > _root.game.player._x && _root.playerDir == 1 || this._parent._x < _root.game.player._x && _root.playerDir == -1)
                    {
                        _root.playerState = "hurt";
                    }
                    else
                    {
                        _root.playerState = "hurt2";
                    } // end else if
                }
                else
                {
                    _root.playerState = "hurt3";
                } // end else if
                _root.playerHealth = _root.playerHealth - this.strength;
                _root.playerInvincible = true;
            } // end if
        } // end if
        if (_global.checkPlayer(this._parent, this._parent.dir, -20) || _global.checkPlayer(this._parent, this._parent.dir, -120) || _global.checkPlayer(this._parent, this._parent.dir * -1, -20) || _global.checkPlayer(this._parent, this._parent.dir * -1, -120))
        {
            if (_root.playerAttacking && this.state != "hurt" && this.state != "hurt_blood")
            {
                _root.playerDx = 0;
                if (_root.playerAttacking && !this.invincible && this.attackTime >= _root.game.player.attackTime)
                {
					
                    if (_root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
                    {
                        if (this.state != "stun" || this.stunCount > 6)
                        {
                            _root.kick.start();
                            this.health = this.health - 15;
                            this.state = "stun";
                            this.stunCount = 0;
                            fallCount = 0;
                            ++_root.hitCount;
                            _root.comboCount = 10;
                            if (_root.hitCount > 2)
                            {
                                _root.comboMeter = true;
                            } // end if
                            this.samurai.play();
                            this._parent._x = this._parent._x - 4 * this._parent.dir;
                        } // end if
                    } // end if
                    if (_root.playerState == "highpunch" || _root.playerState == "lowpunch" || _root.playerState == "punch" || _root.playerState == "jumppunch")
                    {
                        if (this.state != "stun" || this.stunCount > 6)
                        {
                            _root.kick.start();
                            this.health = this.health - 15;
                            this.state = "stun";
                            this.stunCount = 0;
                            fallCount = 0;
                            ++_root.hitCount;
                            _root.comboCount = 10;
                            if (_root.hitCount > 2)
                            {
                                _root.comboMeter = true;
                            } // end if
                            this.samurai.play();
                            this._parent._x = this._parent._x - 4 * this._parent.dir;
                        } // end if
                    }
                    else if (_root.playerState == "vert_highpunch" || _root.playerState == "vert_lowpunch" || _root.playerState == "vert_punch" || _root.playerState == "vert_jumppunch")
                    {
                        if (this.state != "stun" || this.stunCount > 6)
                        {
                            _root.kick.start();
                            this.health = this.health - 15;
                            this.state = "stun";
                            this.stunCount = 0;
                            fallCount = 0;
                            ++_root.hitCount;
                            _root.comboCount = 10;
                            if (_root.hitCount > 2)
                            {
                                _root.comboMeter = true;
                            } // end if
                            this.samurai.play();
                            this._parent._x = this._parent._x - 4 * this._parent.dir;
                        } // end if
                    }
                    else if (_root.playerState == "capespin")
                    {
                        if (this.state != "stun" || this.stunCount > 6)
                        {
                            _root.kick.start();
                            this.health = this.health - 15;
                            this.state = "stun";
                            this.stunCount = 0;
                            fallCount = 0;
                            ++_root.hitCount;
                            _root.comboCount = 10;
                            if (_root.hitCount > 2)
                            {
                                _root.comboMeter = true;
                            } // end if
                            this.samurai.play();
                            this._parent._x = this._parent._x - 4 * this._parent.dir;
                        } // end if
                    } // end else if
                } // end else if
                if (this.health <= 0)
                {
                    _root.score = _root.score + 7500;
                    this.state = "die";
                } // end if
            }
            else if (this.state != "attack" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "stun" && this.state != "fall" && this.attackCount > 10)
            {
                
            } // end if
        } // end else if
    }
    else
    {
        if (!this.flash)
        {
            this.flash = 1;
            if (_root.playerState == "capespin" || _root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
            {
                _root.goon_die.start();
            }
            else
            {
                _root.goon_die_stab.start();
            } // end else if
            this.state = "die";
        }
        else
        {
            ++this.flash;
        } // end else if
        if (this.flash > 50)
        {
            if (this.flash % 4 < 2)
            {
                this._visible = false;
            }
            else
            {
                this._visible = true;
            } // end if
        } // end else if
        if (this.flash > 100)
        {
            this._visible = false;
            ++_root.eKills;
            delete this.onEnterFrame;
        } // end if
    } // end else if
};
_root.starCount = 0;
_global.makeNinjaStar = function (ninja)
{
    if (!_root.isPaused)
    {
        _root.game.ninjastar.duplicateMovieClip("star" + _root.starCount, _root.getNextHighestDepth());
        _root.game["star" + _root.starCount]._xscale = -35 * ninja.dir;
        _root.game["star" + _root.starCount]._yscale = 35;
        _root.game["star" + _root.starCount]._x = ninja._x + 15 * ninja.dir;
        _root.game["star" + _root.starCount]._y = ninja._y - 100;
        _root.game["star" + _root.starCount].dir = ninja.dir;
        _root.game["star" + _root.starCount].speed = 39;
        _root.game["star" + _root.starCount].strength = 3;
        _root.game["star" + _root.starCount].onEnterFrame = function ()
        {
            if (this._x > 30000 || this._x < -30000)
            {
                this.removeMovieClip();
            } // end if
            this._x = this._x + this.speed * this.dir;
            if (this.hitTest(_root.game.player.hitChecker))
            {
                if (_root.playerState != "hurt" && _root.playerState != "hurt2" && !_root.playerInvincible && !_root.playerJumping)
                {
                    if (!_root.m_hurt_sound)
                    {
                        _root.m_hurt.start();
                        _root.m_hurt_sound = true;
                    } // end if
                    if (this._parent._x > _root.game.player._x && _root.playerDir == 1 || this._parent._x < _root.game.player._x && _root.playerDir == -1)
                    {
                        _root.playerState = "hurt";
                    }
                    else
                    {
                        _root.playerState = "hurt2";
                    } // end else if
                    _root.playerHealth = _root.playerHealth - this.strength;
                    _root.playerInvincible = true;
                } // end if
            } // end if
        };
        ++_root.starCount;
    } // end if
};
_global.ninjaAI = function ()
{
    if (_root.isPaused)
    {
        this.gotoAndStop("stand");
        this._parent.dir = 1;
    }
    else
    {
        this.gotoAndStop(this.state);
        if (this.dy != 0)
        {
            this._y = this._y + this.dy;
            this.dy = this.dy + _root.gravity;
            if (this._y > this.defaulty)
            {
                this._y = this.defaulty;
                this.dy = 0;
                this.state = "land";
                this.attackTime = 1.000000E+011;
            } // end if
        } // end if
        if (this.range < 600)
        {
        } // end if
        if (this.health > 0)
        {
            this.range = Math.abs(this._parent._x - _root.game.player._x);
            this.rangey = Math.abs(this._parent._y - _root.game.player._y);
            if (this.range > 300 && this.range < 425 && this.rangey < 400 && this.dy == 0 && random(5) == 0)
            {
                ++this.attackCount;
                if (this.attackCount > 24)
                {
                    this.state = "throw";
                    this.attackCount = 0;
                    _root.woosh.start();
                } // end if
                
            } // end if
            if (this.range > 300 + random(100) && this.rangey < 400 && random(5) == 0 && this.state != "jump" && this.state != "fall" && this.state != "land" && this.state != "throw")
            {
                if (this._parent._x > _root.game.player._x)
                {
                    this._parent.dir = -1;
                }
                else if (this._parent._x < _root.game.player._x)
                {
                    this._parent.dir = 1;
                } // end if
            } // end else if
            if (this.range < 440 - random(60) && this.range > 320 && random(3) == 0)
            {
                if ((this._parent._x > _root.game.player._x && this._parent.dir == -1 || this._parent._x < _root.game.player._x && this._parent.dir == 1) && this.attackCount > 10 && this.state != "attack" && this.state != "jump" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "fall")
                {
                    if (this._parent._y > 700 && this._parent._y < 1900)
                    {
                        if (this.attackCount > 18)
                        {
                            this.state = "throw";
                            this.attackCount = 0;
                            _root.woosh.start();
                        } // end if
                        ++this.attackCount;
                    }
                    else if (!_global.checkWallatt(this._parent, -50, 300 * this._parent.dir))
                    {
                        this.state = "jump";
                        this.dy = -40;
                    }
                    else if (this.attackCount > 10)
                    {
                        this.state = "throw";
                        this.attackCount = 0;
                        _root.woosh.start();
                    }
                    else
                    {
                        ++this.attackCount;
                    } // end else if
                    
                } // end if
            }
            else if (this.range < 100 && this.rangey < 400)
            {
                if (this.state != "attack" && this.state != "retreat" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "fall" && this.state != "jump" && this.state != "land" && this.state != "punch" && this.state != "throw" && this.state != "die")
                {
                    if (this._parent._y > 700 && this._parent._y < 1900)
                    {
                    }
                    else if (random(4) == 0)
                    {
                        this.state = "retreat";
                        this._parent.dir = this._parent.dir * -1;
                    } // end if
                } // end else if
            } // end else if
            this._parent._xscale = this._parent.dir * Math.abs(this._parent._xscale);
            if (this.state == "idle")
            {
                this.defaulty = this._y;
                if (this.range < 600 && this.rangey < 400)
                {
                    this.state = "throw";
                    this.attackCount = 0;
                    _root.woosh.start();
                } // end if
            }
            else if (this.state == "stand")
            {
                if (this.range < 400)
                {
                    if (this._parent._y > 700 && this._parent._y < 1900)
                    {
                    }
                    else
                    {
                        this.state = "walk";
                    } // end if
                } // end else if
                ++this.attackCount;
            }
            else if (this.state == "walk")
            {
                if (!_global.checkWall(this._parent, -50, this.speed * this._parent.dir) && _global.checkEdge(this._parent, 50, this.speed * this._parent.dir * 5))
                {
                    this._parent._x = this._parent._x + this.speed * this._parent.dir;
                }
                else
                {
                    this._parent.dir = this._parent.dir * -1;
                } // end else if
                ++this.attackCount;
                if (this.range < 120 && this.attackCount > 12)
                {
                    this.state = "throw";
                    this.attackCount = 0;
                    _root.woosh.start();
                } // end if
            }
            else if (this.state == "retreat")
            {
                if (!_global.checkWall(this._parent, -50, this.speed * this._parent.dir) && _global.checkEdge(this._parent, 50, this.speed * this._parent.dir * 5))
                {
                    this._parent._x = this._parent._x + this.speed * this._parent.dir;
                }
                else if (random(4) == 0)
                {
                    this._parent.dir = this._parent.dir * -1;
                } // end else if
                ++this.attackCount;
            }
            else if (this.state == "hurt" || this.state == "hurt_blood")
            {
                if (!_global.checkWall(this, -50, -6 * this._parent.dir))
                {
                } // end if
            }
            else if (this.state == "stun")
            {
                ++this.stunCount;
                if (this.stunCount > 9)
                {
                    this.stunCount = 0;
                    _root.comboCount = 0;
                    _root.hitCount = 0;
                    this.state = "hurt_blood";
                } // end if
            }
            else if (this.state == "jump")
            {
                this._parent._x = this._parent._x + 18 * this._parent.dir;
                if (this.dy > 0)
                {
                    this.state = "punch";
                    this.attackTime = getTimer();
                    this.attackCount = 0;
                    _root.woosh.start();
                } // end if
            }
            else if (this.state == "fall")
            {
                this.attackTime = 1.000000E+011;
            }
            else if (this.state == "punch")
            {
                this._parent._x = this._parent._x + 36 * this._parent.dir;
            } // end else if
            if (this.state == "jump" || this.state == "punch")
            {
                if (_global.checkPlayer(this._parent, this._parent.dir, -20) || _global.checkPlayer(this._parent, this._parent.dir, -120) || _global.checkPlayer(this._parent, this._parent.dir * -1, -20) || _global.checkPlayer(this._parent, this._parent.dir * -1, -120))
                {
                    if (_root.playerAttacking)
                    {
                        if (!_root.playerJumping)
                        {
                            _root.playerDx = 0;
                        } // end if
                        if (_root.playerAttacking && this.state != "fall")
                        {
                            _root.kick.start();
                            this.health = this.health - 15;
                            this.state = "fall";
                            this.dy = 12;
                            this.attackTime = 1.000000E+011;
                        } // end if
                    } // end if
                } // end if
            } // end if
            if (this.attack.spear_tip.hitTest(_root.game.player.hitChecker))
            {
                if (_root.playerState != "hurt" && _root.playerState != "hurt2" && _root.playerState != "hurt3" && !_root.playerInvincible && this.attackTime < _root.game.player.attackTime)
                {
                    if (!_root.m_hurt_sound)
                    {
                        _root.m_hurt.start();
                        _root.m_hurt_sound = true;
                    } // end if
                    if (!_root.playerJumping)
                    {
                        if (this._parent._x > _root.game.player._x && _root.playerDir == 1 || this._parent._x < _root.game.player._x && _root.playerDir == -1)
                        {
                            _root.playerState = "hurt";
                        }
                        else
                        {
                            _root.playerState = "hurt2";
                        } // end else if
                    }
                    else
                    {
                        _root.playerState = "hurt3";
                    } // end else if
                    _root.playerHealth = _root.playerHealth - this.strength;
                    _root.playerInvincible = true;
                } // end if
            } // end if
            if (_global.checkPlayer(this._parent, this._parent.dir, -20) || _global.checkPlayer(this._parent, this._parent.dir, -120) || _global.checkPlayer(this._parent, this._parent.dir * -1, -20) || _global.checkPlayer(this._parent, this._parent.dir * -1, -120))
            {
                if (_root.playerAttacking && this.state != "jump" && this.state != "fall" && this.state != "punch" && this.state != "land" && this.state != "hurt" && this.state != "hurt_blood")
                {
                    if (!_root.playerJumping)
                    {
                        _root.playerDx = 0;
                    } // end if
                    if (_root.playerAttacking && this.attackTime >= _root.game.player.attackTime)
                    {
                        if (_root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
                        {
                            if (this.state != "stun" || this.stunCount > 6)
                            {
                                _root.kick.start();
                                this.health = this.health - 15;
                                this.state = "stun";
                                this.stunCount = 0;
                                fallCount = 0;
                                ++_root.hitCount;
                                _root.comboCount = 10;
                                if (_root.hitCount > 2)
                                {
                                    _root.comboMeter = true;
                                } // end if
                                this.ninja.play();
                            } // end if
                        } // end if
                        if (_root.playerState == "highpunch" || _root.playerState == "lowpunch" || _root.playerState == "punch" || _root.playerState == "jumppunch")
                        {
                            if (this.state != "stun" || this.stunCount > 6)
                            {
                                _root.punch2.start();
                                this.health = this.health - 15;
                                this.state = "stun";
                                this.stunCount = 0;
                                fallCount = 0;
                                ++_root.hitCount;
                                _root.comboCount = 10;
                                if (_root.hitCount > 2)
                                {
                                    _root.comboMeter = true;
                                } // end if
                                this.ninja.play();
                            } // end if
                        }
                        else if (_root.playerState == "vert_highpunch" || _root.playerState == "vert_lowpunch" || _root.playerState == "vert_punch" || _root.playerState == "vert_jumppunch")
                        {
                            if (this.state != "stun" || this.stunCount > 6)
                            {
                                _root.punch.start();
                                this.health = this.health - 15;
                                this.state = "stun";
                                this.stunCount = 0;
                                fallCount = 0;
                                ++_root.hitCount;
                                _root.comboCount = 10;
                                if (_root.hitCount > 2)
                                {
                                    _root.comboMeter = true;
                                } // end if
                                this.ninja.play();
                            } // end if
                        }
                        else if (_root.playerState == "capespin")
                        {
                            if (this.state != "stun" || this.stunCount > 6)
                            {
                                _root.kick.start();
                                this.health = this.health - 15;
                                this.state = "stun";
                                this.stunCount = 0;
                                fallCount = 0;
                                ++_root.hitCount;
                                _root.comboCount = 10;
                                if (_root.hitCount > 2)
                                {
                                    _root.comboMeter = true;
                                } // end if
                                this.ninja.play();
                            } // end if
                        } // end else if
                    } // end else if
                    if (this.health <= 0)
                    {
                        if (this.dy != 0)
                        {
                            this._y = this._y + this.dy;
                            this.dy = this.dy + _root.gravity;
                            if (this._y > this.defaulty)
                            {
                                this._y = this.defaulty;
                                this.dy = 0;
                                _root.score = _root.score + 1000;
                                this.state = "die";
                            } // end if
                        } // end if
                    }
                    else if (this.state != "attack" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "fall" && this.state != "jump" && this.state != "land" && this.state != "punch" && this.attackCount > 10)
                    {
                        if (this._parent._y > 700 && this._parent._y < 1900)
                        {
                        }
                        else
                        {
                            this.state = "retreat";
                            this.attackCount = 0;
                            this._parent.dir = this._parent.dir * -1;
                        } // end else if
                        
                    } // end if
                } // end if
            } // end else if
        }
        else
        {
            if (!this.flash)
            {
                if (this._y != this.defaulty)
                {
                    this._y = this._y + this.dy;
                    this.dy = this.dy + _root.gravity;
                    if (this._y > this.defaulty)
                    {
                        this._y = this.defaulty;
                        this.dy = 0;
                        _root.score = _root.score + 1000;
                        this.flash = 1;
                        if (_root.playerState == "capespin" || _root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
                        {
                            _root.goon_die.start();
                        }
                        else
                        {
                            _root.goon_die_stab.start();
                        } // end else if
                        this.state = "die";
                        this.gotoAndStop(this.state);
                    } // end if
                }
                else
                {
                    _root.score = _root.score + 5000;
                    this.flash = 1;
                    if (_root.playerState == "capespin" || _root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
                    {
                        _root.goon_die.start();
                    }
                    else
                    {
                        _root.goon_die_stab.start();
                    } // end else if
                    this.state = "die";
                    this.gotoAndStop(this.state);
                } // end else if
            }
            else
            {
                ++this.flash;
            } // end else if
            if (this.flash > 50)
            {
                if (this.flash % 4 < 2)
                {
                    this._visible = false;
                }
                else
                {
                    this._visible = true;
                } // end if
            } // end else if
            if (this.flash > 100)
            {
                this._visible = false;
                ++_root.eKills;
                delete this.onEnterFrame;
            } // end if
        } // end else if
    } // end else if
};
_global.samuraiAI_OLD = function ()
{
    this.gotoAndStop(this.state);
    if (this.range < 400)
    {
    } // end if
    if (this.health > 0)
    {
        if (this.invincibleCounter > 0)
        {
            if (this.invincibleCounter > 15)
            {
                this.invincible = true;
                if (this.invincibleCounter % 4 > 2)
                {
                    this._visible = false;
                }
                else
                {
                    this._visible = true;
                } // end if
            } // end else if
            ++this.invincibleCounter;
        } // end if
        if (this.invincibleCounter > 40)
        {
            this.invincible = false;
            this.invincibleCounter = 0;
        } // end if
        this.range = Math.abs(this._parent._x - _root.game.player._x);
        this.rangey = Math.abs(this._parent._y - _root.game.player._y);
        if (this.range > 175 && this.rangey < 400)
        {
            if (this._parent._x > _root.game.player._x)
            {
                this._parent.dir = -1;
            }
            else if (this._parent._x < _root.game.player._x)
            {
                this._parent.dir = 1;
            } // end else if
        }
        else if (this.range < 100 && this.range > 10)
        {
            if ((this._parent._x > _root.game.player._x && this._parent.dir == -1 || this._parent._x < _root.game.player._x && this._parent.dir == 1) && this.attackCount > 10 && this.state != "attack" && this.state != "jump" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "fall")
            {
                this.state = "attack";
                this.attackTime = getTimer();
                this.attackCount = 0;
                
            } // end if
        }
        else if (this.range < 30 && this.rangey < 400)
        {
            if (this.state != "attack" && this.state != "retreat" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "fall")
            {
                this.state = "retreat";
                this._parent.dir = this._parent.dir * -1;
            } // end else if
        } // end else if
        this._parent._xscale = this._parent.dir * Math.abs(this._parent._xscale);
        if (this.state == "idle")
        {
            if (this.range < 400 && this.rangey < 400)
            {
                this.state = "stand";
            } // end if
            ++this.attackCount;
        }
        else if (this.state == "stand")
        {
            if (this.range < 350)
            {
                this.state = "walk";
            } // end if
            ++this.attackCount;
        }
        else if (this.state == "walk")
        {
            if (!_global.checkWall(this._parent, -50, this.speed * this._parent.dir) && _global.checkEdge(this._parent, 50, this.speed * this._parent.dir * 5))
            {
                this._parent._x = this._parent._x + this.speed * this._parent.dir;
            } // end if
            ++this.attackCount;
        }
        else if (this.state == "retreat")
        {
            if (!_global.checkWall(this._parent, -50, this.speed * this._parent.dir) && _global.checkEdge(this._parent, 50, this.speed * this._parent.dir * 5))
            {
                this._parent._x = this._parent._x + this.speed * this._parent.dir;
            } // end if
            ++this.attackCount;
        }
        else if (this.state == "hurt" || this.state == "hurt_blood")
        {
            if (!_global.checkWall(this._parent, -50, -6 * this._parent.dir))
            {
            } // end if
            
        } // end else if
        if (this.attack.spear_tip.hitTest(_root.game.player.hitChecker))
        {
            if (_root.playerState != "hurt" && _root.playerState != "hurt2" && !_root.playerInvincible && !_root.playerJumping && this.attackTime < _root.game.player.attackTime)
            {
                if (!_root.m_hurt_sound)
                {
                    _root.m_hurt.start();
                    _root.m_hurt_sound = true;
                } // end if
                if (!_root.playerJumping)
                {
                    if (this._parent._x > _root.game.player._x && _root.playerDir == 1 || this._parent._x < _root.game.player._x && _root.playerDir == -1)
                    {
                        _root.playerState = "hurt";
                    }
                    else
                    {
                        _root.playerState = "hurt2";
                    } // end else if
                }
                else
                {
                    _root.playerState = "hurt3";
                } // end else if
                _root.playerHealth = _root.playerHealth - this.strength;
                _root.playerInvincible = true;
            } // end if
        } // end if
        if (_global.checkPlayer(this._parent, this._parent.dir, -20) || _global.checkPlayer(this._parent, this._parent.dir, -120) || _global.checkPlayer(this._parent, this._parent.dir * -1, -20) || _global.checkPlayer(this._parent, this._parent.dir * -1, -120))
        {
            if (_root.playerAttacking)
            {
                _root.playerDx = 0;
                if (_root.playerAttacking && !this.invincible && this.attackTime >= _root.game.player.attackTime)
                {
                    if (_root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
                    {
                        if (_root.lastHit1 != _root.playerState)
                        {
                            if (_root.lastHit1 == "")
                            {
                                this.invincibleCounter = 1;
                                _root.comboCounter = 0;
                            }
                            else if (_root.lastHit2 == "")
                            {
                                this.invincibleCounter = 1;
                            }
                            else if (_root.lastHit3 == "")
                            {
                                this.invincibleCounter = 1;
                            } // end else if
                            _root.lastHit3 = _root.lastHit2;
                            _root.lastHit2 = _root.lastHit1;
                            _root.lastHit1 = _root.playerState;
                            _root.kick.start();
                            this.health = this.health - 15;
                            this.state = "hurt";
                            fallCount = 0;
                        } // end if
                    } // end if
                    if (_root.playerState == "highpunch" || _root.playerState == "lowpunch" || _root.playerState == "punch" || _root.playerState == "jumppunch")
                    {
                        if (_root.lastHit1 != _root.playerState)
                        {
                            if (_root.lastHit1 == "")
                            {
                                this.invincibleCounter = 1;
                                _root.comboCounter = 0;
                            }
                            else if (_root.lastHit2 == "")
                            {
                                this.invincibleCounter = 1;
                            }
                            else if (_root.lastHit3 == "")
                            {
                                this.invincibleCounter = 1;
                            } // end else if
                            _root.lastHit3 = _root.lastHit2;
                            _root.lastHit2 = _root.lastHit1;
                            _root.lastHit1 = _root.playerState;
                            _root.punch2.start();
                            this.health = this.health - 15;
                            this.state = "hurt_blood";
                            fallCount = 0;
                        } // end if
                    }
                    else if (_root.playerState == "vert_highpunch" || _root.playerState == "vert_lowpunch" || _root.playerState == "vert_punch" || _root.playerState == "vert_jumppunch")
                    {
                        if (_root.lastHit1 != _root.playerState)
                        {
                            if (_root.lastHit1 == "")
                            {
                                this.invincibleCounter = 1;
                                _root.comboCounter = 0;
                            }
                            else if (_root.lastHit2 == "")
                            {
                                this.invincibleCounter = 1;
                            }
                            else if (_root.lastHit3 == "")
                            {
                                this.invincibleCounter = 1;
                            } // end else if
                            _root.lastHit3 = _root.lastHit2;
                            _root.lastHit2 = _root.lastHit1;
                            _root.lastHit1 = _root.playerState;
                            this.state = "hurt_blood";
                            _root.punch.start();
                            this.health = this.health - 15;
                            fallCount = 0;
                        } // end if
                    }
                    else if (_root.playerState == "capespin")
                    {
                        if (_root.lastHit1 != _root.playerState)
                        {
                            if (_root.lastHit1 == "")
                            {
                                this.invincibleCounter = 1;
                                _root.comboCounter = 0;
                            }
                            else if (_root.lastHit2 == "")
                            {
                                this.invincibleCounter = 1;
                            }
                            else if (_root.lastHit3 == "")
                            {
                                this.invincibleCounter = 1;
                            } // end else if
                            _root.lastHit3 = _root.lastHit2;
                            _root.lastHit2 = _root.lastHit1;
                            _root.lastHit1 = _root.playerState;
                            _root.kick.start();
                            this.health = this.health - 15;
                            this.state = "hurt_blood";
                            fallCount = 0;
                        } // end if
                    } // end else if
                } // end else if
                if (_root.comboCounter >= _root.COMBOTIME)
                {
                    _root.comboCounter = 0;
                    _root.lastHit1 = "";
                    _root.lastHit2 = "";
                    _root.lastHit3 = "";
                }
                else
                {
                    var _loc4 = _global.checkForCombo();
                    if (_loc4 > 0)
                    {
                        _global.showCombo(_loc4);
                        _root.comboCounter = 0;
                        _root.lastHit1 = "";
                        _root.lastHit2 = "";
                        _root.lastHit3 = "";
                        this.health = 0;
                    } // end if
                } // end else if
                if (this.health <= 0)
                {
                    _root.score = _root.score + 100;
                    this.state = "die";
                }
                else if (this.state != "attack" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "fall" && this.attackCount > 10)
                {
                    this.state = "retreat";
                    this.attackCount = 0;
                    
                } // end if
            } // end if
        } // end else if
    }
    else
    {
        if (!this.flash)
        {
            this.flash = 1;
            if (_root.playerState == "capespin" || _root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
            {
                _root.goon_die.start();
            }
            else
            {
                _root.goon_die_stab.start();
            } // end else if
            this.state = "die";
        }
        else
        {
            ++this.flash;
        } // end else if
        if (this.flash > 50)
        {
            if (this.flash % 4 < 2)
            {
                this._visible = false;
            }
            else
            {
                this._visible = true;
            } // end if
        } // end else if
        if (this.flash > 100)
        {
            this._visible = false;
            ++_root.eKills;
            delete this.onEnterFrame;
        } // end if
    } // end else if
};
_global.nishiAI = function ()
{
    if (this.health > 0)
    {
        this.gotoAndStop(this.state);
        if (this.range < 400)
        {
        } // end if
        if (this.invincibleCounter > 0)
        {
            if (this.invincibleCounter > 1)
            {
                this.invincible = true;
            } // end if
            ++this.invincibleCounter;
        } // end if
        if (this.invincibleCounter > 38)
        {
            this.invincible = false;
            this.invincibleCounter = 0;
        } // end if
        this.range = Math.abs(this._parent._x - _root.game.player._x);
        this.rangey = Math.abs(this._parent._y - _root.game.player._y);
        if (this.state == "waiting" || this.state == "reveal")
        {
            if (this.range < 300)
            {
                if (_root.bossOverlay._currentframe == 1)
                {
                    _root.bossOverlay.play();
                    
                } // end if
            } // end if
        }
        else
        {
            if (this.range > 170 && this.rangey < 400 && this.range > 50)
            {
                if (this._parent._x > _root.game.player._x)
                {
                    this._parent.dir = -1;
                }
                else if (this._parent._x < _root.game.player._x)
                {
                    this._parent.dir = 1;
                } // end if
            } // end else if
            if (this.range < 600 && (this.state == "stand" || this.state == "retreat"))
            {
                this.state = "run";
                ++this.attackCount;
            }
            else if (this.state == "run")
            {
                if (this.range < 400 && (this._parent._x > _root.game.player._x && this._parent.dir == -1 || this._parent._x < _root.game.player._x && this._parent.dir == 1) && this.attackCount > 10 && this.state != "attack" && this.state != "jump" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "fall")
                {
                    if (this.range > 280 && random(2) == 0)
                    {
                        this.state = "chain";
                        this.attackTime = getTimer();
                        this.attackCount = 0;
                        _root.whip.start();
                    } // end if
                    if (this.range > 160 && random(5) == 0)
                    {
                        this.state = "whip";
                        this.attackTime = getTimer();
                        this.attackCount = 0;
                        _root.whip.start();
                    }
                    else if (this.range > 100 && random(5) == 0)
                    {
                        this.state = "attack";
                        this.attackTime = getTimer();
                        this.attackCount = 0;
                        _root.punch2.start();
                    } // end if
                } // end else if
                if (!_global.checkWall(this, -50, this.speed * this._parent.dir) && _global.checkEdge_boss(this, 50, this.speed * this._parent.dir * 5))
                {
                    this._parent._x = this._parent._x + this.speed * this._parent.dir;
                } // end if
                if (this.range > 600)
                {
                    this.state = "stand";
                } // end if
                ++this.attackCount;
            }
            else if (this.state == "retreat")
            {
            }
            else if (this.state == "hurt" || this.state == "hurt_blood")
            {
                if (!_global.checkWall(this, -50, -6 * this._parent.dir))
                {
                    this._parent._x = this._parent._x - 6 * this._parent.dir;
                }
                else if (this.range < 50 && this.rangey < 400)
                {
                    if (this.state != "attack" && this.state != "retreat" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "die")
                    {
                    } // end if
                } // end else if
            }
            else if (this.state == "stun")
            {
                ++this.stunCount;
                if (this.stunCount > 9)
                {
                    this.stunCount = 0;
                    _root.comboCount = 0;
                    _root.hitCount = 0;
                    this.state = "hurt_blood";
                } // end if
                if (_root.hitCount > 3 + random(4))
                {
                    _root.comboCount = 0;
                    this.invincibleCounter = 1;
                    this.stunCount = 0;
                    if (random(2) == 0)
                    {
                        this.state = "whip";
                        this.attackTime = getTimer() - 1000;
                        this.attackCount = 0;
                        _root.whip.start();
                    }
                    else
                    {
                        this.state = "break";
                        this.attackTime = getTimer() - 1000;
                        this.attackCount = 0;
                        _root.clash.start();
                    } // end else if
                } // end else if
            } // end else if
            this._parent._xscale = this._parent.dir * -1 * Math.abs(this._parent._xscale);
            if (this.attack.spear_tip.hitTest(_root.game.player.hitChecker))
            {
                if (_root.playerState != "hurt" && _root.playerState != "hurt2" && _root.playerState != "hurt3" && !_root.playerInvincible && this.attackTime < _root.game.player.attackTime)
                {
                    if (!_root.m_hurt_sound)
                    {
                        _root.m_hurt.start();
                        _root.m_hurt_sound = true;
                    } // end if
                    if (!_root.playerJumping)
                    {
                        if (this._parent._x > _root.game.player._x && _root.playerDir == 1 || this._parent._x < _root.game.player._x && _root.playerDir == -1)
                        {
                            _root.playerState = "hurt";
                        }
                        else
                        {
                            _root.playerState = "hurt2";
                        } // end else if
                    }
                    else
                    {
                        _root.playerState = "hurt3";
                    } // end else if
                    _root.playerHealth = _root.playerHealth - this.strength;
                    _root.playerInvincible = true;
                } // end if
            } // end if
            if (_root.game.player.hitTest(this._parent))
            {
				var healthShow = Math.floor(this.health / (260 / 100));
				var healthinverse = 100 - healthShow;
				_root.sword.health.gotoAndStop(healthinverse);
				
                if (_root.playerAttacking)
                {
                    _root.playerDx = 0;
                    if (_root.playerAttacking && !this.invincible && this.attackTime >= _root.game.player.attackTime)
                    {
                        if (this.range > 40)
                        {
                            if (this._parent._x > _root.game.player._x)
                            {
                                this._parent.dir = -1;
                            }
                            else if (this._parent._x < _root.game.player._x)
                            {
                                this._parent.dir = 1;
                            } // end if
                        } // end else if
                        if (_root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
                        {
                            if (this.state != "stun" || this.stunCount > 6)
                            {
                                _root.kick.start();
                                this.health = this.health - 5;
                                this.state = "stun";
                                this.stunCount = 0;
                                fallCount = 0;
                                ++_root.hitCount;
                                _root.comboCount = 10;
                                if (_root.hitCount > 2)
                                {
                                    _root.comboMeter = true;
                                } // end if
                                this.tengu.play();
                            } // end if
                        } // end if
                        if (_root.playerState == "highpunch" || _root.playerState == "lowpunch" || _root.playerState == "punch" || _root.playerState == "jumppunch")
                        {
                            if (this.state != "stun" || this.stunCount > 6)
                            {
                                _root.punch2.start();
                                this.health = this.health - 5;
                                this.state = "stun";
                                this.stunCount = 0;
                                fallCount = 0;
                                ++_root.hitCount;
                                _root.comboCount = 10;
                                if (_root.hitCount > 2)
                                {
                                    _root.comboMeter = true;
                                } // end if
                                this.tengu.play();
                            } // end if
                        }
                        else if (_root.playerState == "vert_highpunch" || _root.playerState == "vert_lowpunch" || _root.playerState == "vert_punch" || _root.playerState == "vert_jumppunch")
                        {
                            if (this.state != "stun" || this.stunCount > 6)
                            {
                                _root.punch.start();
                                this.health = this.health - 5;
                                this.state = "stun";
                                this.stunCount = 0;
                                fallCount = 0;
                                ++_root.hitCount;
                                _root.comboCount = 10;
                                if (_root.hitCount > 2)
                                {
                                    _root.comboMeter = true;
                                } // end if
                                this.tengu.play();
                            } // end if
                        }
                        else if (_root.playerState == "capespin")
                        {
                            if (this.state != "stun" && _root.hitCount < 4 || _root.hitCount < 4)
                            {
                                _root.kick.start();
                                this.health = this.health - 5;
                                this.state = "stun";
                                this.stunCount = 0;
                                fallCount = 0;
                                ++_root.hitCount;
                                _root.comboCount = 10;
                                if (_root.hitCount > 2)
                                {
                                    _root.comboMeter = true;
                                } // end if
                                this.tengu.play();
                            } // end if
                        } // end else if
                    } // end else if
                    if (this.health <= 0)
                    {
                        _root.score = _root.score + 15000;
                        this.state = "die";
                    } // end if
                }
                else if (this.state != "attack" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "fall" && this.attackCount > 10)
                {
                    
                } // end if
            } // end else if
        } // end else if
    }
    else
    {
        this.gotoAndStop("die");
        if (!this.flash)
        {
            this.flash = 1;
            if (_root.playerState == "capespin" || _root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
            {
                _root.goon_die.start();
            }
            else
            {
                _root.goon_die_stab.start();
            } // end else if
            this.state = "die";
        }
        else
        {
            ++this.flash;
        } // end else if
        if (this.flash > 50)
        {
            if (this.flash % 4 < 2)
            {
                this._visible = false;
            }
            else
            {
                this._visible = true;
            } // end if
        } // end else if
        if (this.flash > 100)
        {
            this._visible = false;
            ++_root.eKills;
            delete this.onEnterFrame;
        } // end if
    } // end else if
};
_global.rtenguAI = function ()
{
    if (this.health > 0)
    {
        if (this.invincibleCounter > 0)
        {
            this.invincible = true;
            if (this.invincibleCounter % 4 > 2)
            {
                
            } // end if
            this.invincibleCounter = this.invincibleCounter + 1;
        } // end if
        if (this.invincibleCounter > 64)
        {
            this.invincible = false;
            this.invincibleCounter = 0;
        } // end if
        this.gotoAndStop(this.state);
        if (this.dy != 0)
        {
            this._parent._y = this._parent._y + this.dy;
            this.dy = this.dy + _root.gravity;
            if (this._parent._y > this.defaulty)
            {
                this._parent._y = this.defaulty;
                this.dy = 0;
                this.state = "land";
                this.attackTime = 1.000000E+011;
            } // end if
        } // end if
        if (this.range < 1500)
        {
        } // end if
        this.range = Math.abs(this._parent._x - _root.game.player._x);
        this.rangey = Math.abs(this._parent._y - _root.game.player._y);
        if (this.state == "waiting" || this.state == "reveal")
        {
            if (this.range < 350)
            {
                if (_root.bossOverlay._currentframe == 1)
                {
                    _root.bossOverlay.play();
                    
                } // end if
            } // end if
        }
        else
        {
            if (this.range > 300)
            {
                if (this._parent._x > _root.game.player._x)
                {
                    this._parent.dir = -1;
                }
                else if (this._parent._x < _root.game.player._x)
                {
                    this._parent.dir = 1;
                } // end if
            } // end else if
            if (this.state != "run")
            {
                this.sfxCount = 0;
            } // end if
            if (this.state == "stand")
            {
                if (this.range > 10 && this.range < 600)
                {
                    this.state = "run_start";
                    ++this.attackCount;
                } // end if
            }
            else if (this.state == "run")
            {
                if (this.sfxCount > 2 + random(2))
                {
                    _root.woosh.start();
                    this.sfxCount = 0;
                }
                else
                {
                    ++this.sfxCount;
                } // end else if
                if (this.range < 320 && this.attackCount > 16 && (this._parent._x > _root.game.player._x && this._parent.dir == -1 || this._parent._x < _root.game.player._x && this._parent.dir == 1))
                {
                    ++this.attackCount;
                    if (this.range < 200 && this.range > 150 && random(8) == 0)
                    {
                        this.state = "attack";
                        this.attackTime = getTimer();
                        this.attackCount = 0;
                        _root.punch2.start();
                    }
                    else if (this.range > 260 && this._parent._x > 17450 && random(8) == 0)
                    {
                        this.state = "jump";
                        this.dy = -40;
                    } // end else if
                }
                else
                {
                    this.attackTime = getTimer();
                } // end else if
                if (this._parent._x < 17300)
                {
                    ++_root.flipCounter;
                    if (_root.flipCounter > 5)
                    {
                        this._parent._x = this._parent._x + this.speed;
                        this._parent.dir = 1;
                        _root.flipCounter = 0;
                    } // end if
                }
                else if (this._parent._x > 18250)
                {
                    this._parent._x = this._parent._x - this.speed;
                    this._parent.dir = -1;
                }
                else
                {
                    this._parent._x = this._parent._x + this.speed * this._parent.dir;
                } // end else if
                if (this.range > 600)
                {
                    this.state = "stand";
                } // end if
                ++this.attackCount;
            }
            else if (this.state == "retreat")
            {
                this.state = "stand";
            }
            else if (this.state == "hurt" || this.state == "hurt_blood")
            {
                if (!_global.checkWall(_parent, -50, -6 * this._parent.dir))
                {
                    this._parent._x = this._parent._x - 6 * this._parent.dir;
                } // end if
            }
            else if (this.state == "stun")
            {
                ++this.stunCount;
                if (this.stunCount > 10)
                {
                    this.stunCount = 0;
                    _root.comboCount = 0;
                    _root.hitCount = 0;
                    this.state = "hurt_blood";
                } // end if
                if (_root.hitCount > 3 + random(6))
                {
                    _root.comboCount = 0;
                    this.invincibleCounter = 1;
                    this.stunCount = 0;
                    if (random(3) == 0)
                    {
                        this.state = "break";
                        this.attackTime = getTimer() - 1000;
                        this.attackCount = 0;
                        _root.clash.start();
                    }
                    else
                    {
                        this.state = "jump";
                        this.dy = -40;
                    } // end if
                } // end else if
            }
            else if (this.state == "jump")
            {
                this._parent._x = this._parent._x + this.speed * this._parent.dir;
                if (this.dy > 0)
                {
                    if (random(4) == 0)
                    {
                        this.state = "fall";
                    }
                    else
                    {
                        this.state = "spear";
                        this.attackTime = getTimer();
                        this.attackCount = 0;
                        _root.punch2.start();
                    } // end if
                } // end else if
            }
            else if (this.state == "fall")
            {
                this._parent._x = this._parent._x + this.speed * this._parent.dir;
            }
            else if (this.state == "spear")
            {
                this._parent._x = this._parent._x + this.speed * this._parent.dir * 1.800000E+000;
                this.attackTime = getTimer();
            } // end else if
            this._parent._xscale = this._parent.dir * -1 * Math.abs(this._parent._xscale);
            if (this.attack.spear_tip.hitTest(_root.game.player.hitChecker) || this.jump.attack.spear_tip.hitTest(_root.game.player.hitChecker))
            {
                if (_root.playerState != "hurt" && _root.playerState != "hurt2" && _root.playerState != "hurt3" && !_root.playerInvincible && this.attackTime < _root.game.player.attackTime)
                {
                    if (!_root.m_hurt_sound)
                    {
                        _root.m_hurt.start();
                        _root.m_hurt_sound = true;
                    } // end if
                    if (!_root.playerJumping)
                    {
                        if (this._parent._x > _root.game.player._x && _root.playerDir == 1 || this._parent._x < _root.game.player._x && _root.playerDir == -1)
                        {
                            _root.playerState = "hurt";
                        }
                        else
                        {
                            _root.playerState = "hurt2";
                        } // end else if
                    }
                    else
                    {
                        _root.playerState = "hurt3";
                    } // end else if
                    _root.playerHealth = _root.playerHealth - this.strength;
                    _root.playerInvincible = true;
                } // end if
            } // end if
            if (_root.game.player.hitTest(this._parent))
            {
				//ÉËº¦Ñª²Û´¦Àí
				
				var healthShow = Math.floor(this.health / (120 / 100));
				var healthinverse = 100 - healthShow;
				_root.sword.health.gotoAndStop(healthinverse);
			
				trace("ÉËº¦"+healthShow);
				
                if (_root.playerAttacking && this._parent._y == this.defaulty)
                {
                    _root.playerDx = 0;
                    if (_root.playerAttacking && this.attackTime >= _root.game.player.attackTime)
                    {
                        if (_root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
                        {
                            if (this.state != "stun" || this.stunCount > 6)
                            {
                                _root.kick.start();
								
                                this.health = this.health - 5;
                                this.state = "stun";
                                this.stunCount = 0;
                                fallCount = 0;
                                ++_root.hitCount;
                                _root.comboCount = 10;
                                if (_root.hitCount > 2)
                                {
                                    _root.comboMeter = true;
                                } // end if
                                this.tengu.play();
                            } // end if
                        } // end if
                        if (_root.playerState == "highpunch" || _root.playerState == "lowpunch" || _root.playerState == "punch" || _root.playerState == "jumppunch")
                        {
                            if (this.state != "stun" || this.stunCount > 6)
                            {
                                _root.kick.start();
                                this.health = this.health - 5;
                                this.state = "stun";
                                this.stunCount = 0;
                                fallCount = 0;
                                ++_root.hitCount;
                                _root.comboCount = 10;
                                if (_root.hitCount > 2)
                                {
                                    _root.comboMeter = true;
                                } // end if
                                this.tengu.play();
                                if (!_global.checkWall(_parent, -50, -6 * this._parent.dir))
                                {
                                    this._parent._x = this._parent._x - 6 * this._parent.dir;
                                } // end if
                            } // end if
                        }
                        else if (_root.playerState == "vert_highpunch" || _root.playerState == "vert_lowpunch" || _root.playerState == "vert_punch" || _root.playerState == "vert_jumppunch")
                        {
                            if (this.state != "stun" || this.stunCount > 6)
                            {
                                _root.kick.start();
                                this.health = this.health - 5;
                                this.state = "stun";
                                this.stunCount = 0;
                                fallCount = 0;
                                ++_root.hitCount;
                                _root.comboCount = 10;
                                if (_root.hitCount > 2)
                                {
                                    _root.comboMeter = true;
                                } // end if
                                this.tengu.play();
                                if (!_global.checkWall(_parent, -50, -6 * this._parent.dir))
                                {
                                    this._parent._x = this._parent._x - 6 * this._parent.dir;
                                } // end if
                            } // end if
                        }
                        else if (_root.playerState == "capespin")
                        {
                            if (this.state != "stun" || this.stunCount > 6)
                            {
                                _root.kick.start();
                                this.health = this.health - 5;
                                this.state = "stun";
                                this.stunCount = 0;
                                fallCount = 0;
                                ++_root.hitCount;
                                _root.comboCount = 10;
                                if (_root.hitCount > 2)
                                {
                                    _root.comboMeter = true;
                                } // end if
                                this.tengu.play();
                                if (!_global.checkWall(_parent, -50, -6 * this._parent.dir))
                                {
                                    this._parent._x = this._parent._x - 6 * this._parent.dir;
                                } // end if
                            } // end if
                        } // end else if
                    } // end else if
                    if (this.health <= 0)
                    {
                        _root.score = _root.score + 10000;
                        this.state = "die";
                    } // end if
                }
                else if (this.state != "attack" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "stun" && this.state != "fall" && this.attackCount > 10)
                {
                    
                } // end if
            } // end else if
        } // end else if
    }
    else
    {
        this.gotoAndStop("die");
        if (!this.flash)
        {
            this.flash = 1;
            if (_root.playerState == "capespin" || _root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
            {
                _root.goon_die.start();
            }
            else
            {
                _root.goon_die_stab.start();
            } // end else if
            this.state = "die";
        }
        else
        {
            ++this.flash;
        } // end else if
        if (this.flash > 50)
        {
            if (this.flash % 4 < 2)
            {
                this._visible = false;
            }
            else
            {
                this._visible = true;
            } // end if
        } // end else if
        if (this.flash > 100)
        {
            this._visible = false;
            ++_root.eKills;
            delete this.onEnterFrame;
        } // end if
    } // end else if
};
_root.kiCount = 0;
_global.makeKi = function (boss, fast)
{
    _root.splash.start();
    _root.game.kiSpawn.duplicateMovieClip("ki" + _root.kiCount, _root.getNextHighestDepth());
    _root.game["ki" + _root.kiCount]._xscale = 140;
    _root.game["ki" + _root.kiCount]._yscale = 120;
    _root.game["ki" + _root.kiCount]._x = boss._x + 15 * boss.dir;
    _root.game["ki" + _root.kiCount]._y = boss._y + 105;
    _root.game["ki" + _root.kiCount].dir = boss.dir;
    if (fast)
    {
        _root.game["ki" + _root.kiCount].speed = 36;
    }
    else
    {
        _root.game["ki" + _root.kiCount].speed = 36;
    } // end else if
    _root.game["ki" + _root.kiCount].strength = 6;
    _root.game["ki" + _root.kiCount]._xscale = boss.dir * Math.abs(_root.game["ki" + _root.kiCount]._xscale);
    _root.game["ki" + _root.kiCount].onEnterFrame = function ()
    {
        if (this._x > 30000 || this._x < -30000)
        {
            this.removeMovieClip();
        } // end if
        this._x = this._x + this.speed * this.dir;
        if (this.hitBox.hitTest(_root.game.player.hitChecker))
        {
            if (_root.playerState != "hurt" && _root.playerState != "hurt2" && _root.playerState != "hurt3" && !_root.playerInvincible)
            {
                if (!_root.m_hurt_sound)
                {
                    _root.m_hurt.start();
                    _root.m_hurt_sound = true;
                } // end if
                if (!_root.playerJumping)
                {
                    if (this._parent._x > _root.game.player._x && _root.playerDir == 1 || this._parent._x < _root.game.player._x && _root.playerDir == -1)
                    {
                        _root.playerState = "hurt";
                    }
                    else
                    {
                        _root.playerState = "hurt2";
                    } // end else if
                }
                else
                {
                    _root.playerState = "hurt3";
                } // end else if
                _root.playerHealth = _root.playerHealth - this.strength;
                _root.playerInvincible = true;
            } // end if
        } // end if
    };
    ++_root.kiCount;
};
_global.shyAI = function ()
{
    if (this.health > 0)
    {
        this.gotoAndStop(this.state);
        if (this.range < 400)
        {
        } // end if
        if (this.invincibleCounter > 0)
        {
            if (this.invincibleCounter > 10)
            {
                this.invincible = true;
            } // end if
            ++this.invincibleCounter;
        } // end if
        if (this.invincibleCounter > 24)
        {
            this.invincible = false;
            this.invincibleCounter = 0;
        } // end if
        if (this.falling)
        {
            this.state = "fall";
            if (this._parent._y < 450)
            {
                this.dy = this.dy + 2;
                this._parent._y = this._parent._y + this.dy;
            }
            else
            {
                this._parent._y = 450;
                this.falling = false;
                this.dy = 0;
                this.state = "land";
                _root.isPaused = false;
            } // end else if
        }
        else
        {
            this.dy = 26;
        } // end else if
        this.range = Math.abs(this._parent._x - _root.game.player._x);
        this.rangey = Math.abs(this._parent._y - _root.game.player._y);
        if (!_root.bridgeFell)
        {
            if (this.range < 240)
            {
                if (_root.bossOverlay._currentframe == 1 && !_root.bossedOnce)
                {
                    _root.bossOverlay.play();
                    
                } // end if
            } // end if
        }
        else
        {
            if (this.range > 250 && this.rangey < 400)
            {
                if (this._parent._x > _root.game.player._x)
                {
                    this._parent.dir = -1;
                    this.flipCount = 0;
                }
                else if (this._parent._x < _root.game.player._x)
                {
                    this.flipCount = 0;
                    this._parent.dir = 1;
                } // end else if
            }
            else if (this.range < 10)
            {
            } // end else if
            if (this.range < 500 && (this.state == "stand" || this.state == "waiting" || this.state == "retreat"))
            {
                this.state = "run";
                ++this.attackCount;
            }
            else if (this.state == "run")
            {
                if (this.range < 350 && (this._parent._x > _root.game.player._x && this._parent.dir == -1 || this._parent._x < _root.game.player._x && this._parent.dir == 1) && this.attackCount > 10 && this.state != "attack" && this.state != "jump" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "fall")
                {
                    if (this.range > 200 && random(4) == 0)
                    {
                        this.state = "far_attack";
                        this.attackTime = getTimer();
                        this.attackCount = 0;
                        if (this._parent._x > _root.game.player._x)
                        {
                            this._parent.dir = -1;
                        }
                        else if (this._parent._x < _root.game.player._x)
                        {
                            this._parent.dir = 1;
                        } // end else if
                    }
                    else if (this.range > 150 && random(4) == 0)
                    {
                        this.state = "attack";
                        this.attackTime = getTimer();
                        this.attackCount = 0;
                        if (this._parent._x > _root.game.player._x)
                        {
                            this._parent.dir = -1;
                        }
                        else if (this._parent._x < _root.game.player._x)
                        {
                            this._parent.dir = 1;
                        } // end if
                    } // end else if
                } // end else if
                if (!_global.checkWall(this, -50, this.speed * this._parent.dir) && _global.checkEdge_boss(this, 50, this.speed * this._parent.dir * 5))
                {
                    this._parent._x = this._parent._x + this.speed * this._parent.dir;
                    
                } // end if
                if (this.range > 500)
                {
                    this.state = "stand";
                } // end if
                ++this.attackCount;
            }
            else if (this.state == "retreat")
            {
                if (!_global.checkWall(this, -50, this.speed * this._parent.dir) && _global.checkEdge_boss(this, 50, this.speed * this._parent.dir * 5))
                {
                    this._parent._x = this._parent._x + this.speed * this._parent.dir;
                } // end if
                ++this.attackCount;
                if (this.range > 300)
                {
                    this.state = "run";
                } // end if
            }
            else if (this.state == "hurt" || this.state == "hurt_blood")
            {
                if (!_global.checkWall(this, -50, -6 * this._parent.dir))
                {
                    this._parent._x = this._parent._x - 18 * this._parent.dir;
                } // end if
            }
            else if (this.state == "block")
            {
                if (_root.playerAttacking && this.blockCount > 3)
                {
                    if (_global.checkPlayer_boss(this, this._parent.dir, 0) || _global.checkPlayer_boss(this, this._parent.dir * -1, -120))
                    {
                        if (!_global.checkWall(this, -50, -6 * this._parent.dir))
                        {
                            this._parent._x = this._parent._x - 10 * this._parent.dir;
                        } // end if
                        this.blockCount = 0;
                    } // end if
                } // end if
                ++this.blockCount;
                if (this.blockCount > 16 || random(24) == 0)
                {
                    this.state = "break";
                    this.attackTime = getTimer() - 1000;
                    this.attackCount = 0;
                    this.invincible = true;
                    this.invincibleCounter = 1;
                    _root.clash.start();
                } // end if
            }
            else if (this.state == "stun")
            {
                ++this.stunCount;
                if (this.stunCount > 10)
                {
                    this.stunCount = 0;
                    _root.comboCount = 0;
                    _root.hitCount = 0;
                    this.state = "hurt_blood";
                } // end if
                if (_root.hitCount > 2 + random(4))
                {
                    _root.comboCount = 0;
                    this.stunCount = 0;
                    if (random(12) == 0)
                    {
                        this.state = "break";
                        this.attackTime = getTimer() - 1000;
                        this.attackCount = 0;
                        _root.clash.start();
                    }
                    else
                    {
                        this.state = "block";
                        this.blockCount = 0;
                    } // end if
                } // end else if
                if (this._parent._x > _root.game.player._x)
                {
                    this._parent.dir = -1;
                }
                else if (this._parent._x < _root.game.player._x)
                {
                    this._parent.dir = 1;
                } // end else if
            } // end else if
            this._parent._xscale = this._parent.dir * Math.abs(this._parent._xscale);
            if (this.attack.spear_tip.hitTest(_root.game.player.hitChecker))
            {
                if (_root.playerState != "hurt" && _root.playerState != "hurt2" && _root.playerState != "hurt3" && !_root.playerInvincible && this.attackTime < _root.game.player.attackTime)
                {
                    if (!_root.m_hurt_sound)
                    {
                        _root.m_hurt.start();
                        _root.m_hurt_sound = true;
                    } // end if
                    if (!_root.playerJumping)
                    {
                        if (this._parent._x > _root.game.player._x && _root.playerDir == 1 || this._parent._x < _root.game.player._x && _root.playerDir == -1)
                        {
                            _root.playerState = "hurt";
                        }
                        else
                        {
                            _root.playerState = "hurt2";
                        } // end else if
                    }
                    else
                    {
                        _root.playerState = "hurt3";
                    } // end else if
                    _root.playerHealth = _root.playerHealth - this.strength;
                    _root.playerInvincible = true;
                } // end if
            } // end if
            if (_global.checkPlayer_boss(this, this._parent.dir, 0) || _global.checkPlayer_boss(this, this._parent.dir * -1, -120))
            {
				
                if (_root.playerAttacking && !this.invincible && this.attackTime >= _root.game.player.attackTime)
                {
                    _root.playerDx = 0;
                    if (_root.playerAttacking && this.state != "hurt" && this.state != "hurt_blood" && this.state != "fall" && this.state != "block" && this.state != "land" && this.state != "break" && !this.invincible)
                    {
						trace("ÉËº¦");
						var healthShow = Math.floor(this.health / (250 / 100));
						var healthinverse = 100 - healthShow;
						_root.sword.health.gotoAndStop(healthinverse);
						
						
                        if (_root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
                        {
                            if (this.state != "stun" || this.stunCount > 6)
                            {
                                _root.kick.start();
                                this.health = this.health - 5;
                                this.state = "stun";
                                this.stunCount = 0;
                                fallCount = 0;
                                ++_root.hitCount;
                                _root.comboCount = 10;
                                if (_root.hitCount > 2)
                                {
                                    _root.comboMeter = true;
                                } // end if
                                this.stun.play();
                            } // end if
                        } // end if
                        if (_root.playerState == "highpunch" || _root.playerState == "lowpunch" || _root.playerState == "punch" || _root.playerState == "jumppunch")
                        {
                            if (this.state != "stun" || this.stunCount > 6)
                            {
                                _root.punch2.start();
                                this.health = this.health - 6;
                                this.state = "stun";
                                this.stunCount = 0;
                                fallCount = 0;
                                ++_root.hitCount;
                                _root.comboCount = 10;
                                if (_root.hitCount > 2)
                                {
                                    _root.comboMeter = true;
                                } // end if
                                this.stun.play();
                            } // end if
                        }
                        else if (_root.playerState == "vert_highpunch" || _root.playerState == "vert_lowpunch" || _root.playerState == "vert_punch" || _root.playerState == "vert_jumppunch")
                        {
                            if (this.state != "stun" || this.stunCount > 6)
                            {
                                _root.punch.start();
                                this.health = this.health - 8;
                                this.state = "stun";
                                this.stunCount = 0;
                                fallCount = 0;
                                ++_root.hitCount;
                                _root.comboCount = 10;
                                if (_root.hitCount > 2)
                                {
                                    _root.comboMeter = true;
                                } // end if
                                this.stun.play();
                            } // end if
                        }
                        else if (_root.playerState == "capespin")
                        {
                            if (this.state != "stun" || this.stunCount > 6)
                            {
                                _root.kick.start();
                                this.health = this.health - 5;
                                this.state = "stun";
                                this.stunCount = 0;
                                fallCount = 0;
                                ++_root.hitCount;
                                _root.comboCount = 10;
                                if (_root.hitCount > 2)
                                {
                                    _root.comboMeter = true;
                                } // end if
                                this.stun.play();
                            } // end if
                        } // end else if
                    } // end else if
                    if (_root.comboCounter >= _root.COMBOTIME)
                    {
                        _root.comboCounter = 0;
                        _root.lastHit1 = "";
                        _root.lastHit2 = "";
                        _root.lastHit3 = "";
                    }
                    else
                    {
                        var _loc4 = _global.checkForCombo();
                        if (_loc4 > 0)
                        {
                            _global.showCombo(_loc4);
                            _root.comboCounter = 0;
                            _root.lastHit1 = "";
                            _root.lastHit2 = "";
                            _root.lastHit3 = "";
                        } // end if
                    } // end else if
                    if (this.health <= 0)
                    {
                        _root.score = _root.score + 25000;
                        this.state = "die";
                    } // end if
                }
                else if (this.state != "attack" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "fall" && this.attackCount > 10)
                {
                    if (this.range < 30)
                    {
                        this.state = "retreat";
                        this.attackCount = 0;
                    } // end if
                    
                } // end if
            } // end else if
        } // end else if
    }
    else
    {
        this.gotoAndStop("die");
        if (!this.flash)
        {
            this.flash = 1;
            if (_root.playerState == "capespin" || _root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
            {
                _root.goon_die.start();
            }
            else
            {
                _root.goon_die_stab.start();
            } // end else if
            this.state = "die";
        }
        else
        {
            ++this.flash;
        } // end else if
        if (this.flash > 50)
        {
            if (this.flash % 4 < 2)
            {
                this._visible = false;
            }
            else
            {
                this._visible = true;
            } // end if
        } // end else if
        if (this.flash > 100)
        {
            this._visible = false;
            ++_root.eKills;
            delete this.onEnterFrame;
        } // end if
    } // end else if
};
_global.ATTACK_RANGE = 80;
_global.ATTACK_RANGE = 100;
_global.goonAI = function ()
{
    this.gotoAndStop(this.state);
    if (this.health > 0)
    {
        this.range = Math.abs(this._x - _root.game.player._x);
        this.rangey = Math.abs(this._y - _root.game.player._y);
        if (this.range > 180 && this.rangey < 400)
        {
            if (this._x > _root.game.player._x)
            {
                this.dir = -1;
            }
            else if (this._x < _root.game.player._x)
            {
                this.dir = 1;
            } // end else if
        }
        else if (this.range < 180 && this.rangey < 400 && _root.playerAttacking && (this.dir == 1 && _root.playerDir == 1 && this._x > _root.game.player._x || this.dir == -1 && _root.playerDir == -1 && this._x < _root.game.player._x))
        {
            this.state = "attack";
            this.attackCount = 0;
            this.dir = this.dir * -1;
        }
        else if (this.range < _global.ATTACK_RANGE && this.rangey < 400 && this.state != "attack" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "fall" && this.attackCount > 10)
        {
            this.state = "attack";
            this.attackCount = 0;
        }
        else if (this.range < 50 && this.rangey < 400 && this.state != "attack" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "fall")
        {
            this.state = "retreat";
        } // end else if
        this._xscale = this.dir * Math.abs(this._xscale);
        if (this.state == "idle")
        {
            if (this.range < 400 && this.rangey < 400)
            {
                this.state = "stand";
            } // end if
        }
        else if (this.state == "stand")
        {
            ++this.attackCount;
            rand = Math.random() - Math.random();
            if (this.range < 100 && this.attackCount > 5 && rand > 7.000000E-001)
            {
                this.state = "attack";
                this.attackCount = 0;
            }
            else if (this.range < 150 && this.attackCount < 8)
            {
                rand = Math.random() - Math.random();
                if (rand > 0)
                {
                    this.state = "retreat";
                    this.attackCount = int(-Math.random() * 10);
                    if (rand > 5.000000E-001)
                    {
                        this.dir = this.dir * -1;
                    } // end if
                }
                else
                {
                    this.state = "walk";
                } // end else if
            }
            else if (this.attackCount > Math.random() * 20 + 25 || this.range > 300)
            {
                this.state = "walk";
            } // end else if
        }
        else if (this.state == "walk")
        {
            if (!_global.checkWall(this, -50, this.speed * this.dir) && _global.checkEdge(this, 50, this.speed * this.dir * 5))
            {
                this._x = this._x + this.speed * this.dir;
            } // end if
            ++this.attackCount;
        }
        else if (this.state == "retreat")
        {
            if (!_global.checkWall(this, -50, -this.speed * this.dir) && _global.checkEdge(this, 50, -this.speed * this.dir * 5))
            {
                this._x = this._x - this.speed * this.dir;
            } // end if
            ++this.attackCount;
            if (this.attackCount > 5 || this.range > Math.random() * 100 + 250)
            {
                rand = Math.random() - Math.random();
                if (rand > 5.000000E-001)
                {
                    this.state = "walk";
                }
                else
                {
                    this.state = "attack";
                    this.attackCount = 0;
                } // end if
            } // end else if
        }
        else if (this.state == "hurt" || this.state == "hurt_blood")
        {
            if (!_global.checkWall(this, -50, -6 * this.dir))
            {
                this._x = this._x - 6 * this.dir;
            } // end if
        }
        else if (this.state == "fall" && fallCount < 6)
        {
            if (!_global.checkWall(this, -50, -10 * this.dir))
            {
                this._x = this._x - 10 * this.dir;
            } // end if
            ++this.fallCount;
        } // end else if
        if (_global.checkPlayer(this, this.dir, -20))
        {
            _root.playerDx = 0;
            if (_root.playerAttacking && this.state != "hurt" && this.state != "hurt_blood" && this.state != "fall")
            {
                this.invincible = true;
                if (_root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
                {
                    _root.kick.start();
                    this.health = this.health - 15;
                    this.state = "hurt";
                    fallCount = 0;
                }
                else if (_root.playerState == "highpunch" || _root.playerState == "lowpunch" || _root.playerState == "punch" || _root.playerState == "jumppunch")
                {
                    _root.punch2.start();
                    this.health = this.health - 15;
                    this.state = "hurt_blood";
                    fallCount = 0;
                }
                else if (_root.playerState == "vert_highpunch" || _root.playerState == "vert_lowpunch" || _root.playerState == "vert_punch" || _root.playerState == "vert_jumppunch")
                {
                    _root.punch.start();
                    this.health = this.health - 15;
                    this.state = "hurt_blood";
                    fallCount = 0;
                    
                } // end else if
                ++_root.hitCount;
                _root.comboCount = 10;
                if (_root.hitCount > 2)
                {
                    _root.comboMeter = true;
                } // end if
                if (this.health <= 0)
                {
                    _root.score = _root.score + 100;
                    this.state = "die";
                    _root.hitCount = 0;
                } // end if
            }
            else if (this.state == "attack" && _root.playerState != "hurt" && !_root.playerInvincible)
            {
                _root.m_hurt.start();
                _root.playerState = "hurt";
                _root.playerHealth = _root.playerHealth - this.strength;
                _root.playerInvincible = true;
            }
            else if (this.state != "attack" && this.state != "hurt" && this.state != "hurt_blood" && this.state != "fall" && this.attackCount > 10)
            {
                this.state = "attack";
                this.attackCount = 0;
            } // end else if
        }
        else if (_global.checkPlayer(this, this.dir, -120))
        {
            _root.playerDx = 0;
            if (_root.playerAttacking && this.state != "hurt" && this.state != "hurt_blood" && this.state != "fall")
            {
                if (_root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
                {
                    _root.kick.start();
                    this.health = this.health - 15;
                    this.state = "fall";
                }
                else if (_root.playerState == "highpunch" || _root.playerState == "lowpunch" || _root.playerState == "punch" || _root.playerState == "jumppunch")
                {
                    _root.punch2.start();
                    this.health = this.health - 15;
                    this.state = "hurt_blood";
                }
                else if (_root.playerState == "vert_highpunch" || _root.playerState == "vert_lowpunch" || _root.playerState == "vert_punch" || _root.playerState == "vert_jumppunch")
                {
                    _root.punch.start();
                    this.health = this.health - 15;
                    this.state = "hurt_blood";
                } // end else if
                this.invincible = true;
                fallCount = 0;
                if (this.health <= 0)
                {
                    _root.score = _root.score + 100;
                    this.state = "die";
                } // end if
                ++_root.hitCount;
                _root.comboCount = 10;
                if (_root.hitCount > 2)
                {
                    _root.comboMeter = true;
                } // end if
            } // end if
        } // end else if
    }
    else
    {
        if (!this.flash)
        {
            this.flash = 1;
            if (_root.playerState == "capespin" || _root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
            {
                _root.goon_die.start();
            }
            else
            {
                _root.goon_die_stab.start();
            } // end else if
            this.state = "die";
        }
        else
        {
            ++this.flash;
        } // end else if
        if (this.flash > 50)
        {
            if (this.flash % 4 < 2)
            {
                this._visible = false;
            }
            else
            {
                this._visible = true;
            } // end if
        } // end else if
        if (this.flash > 100)
        {
            this._visible = false;
            ++_root.eKills;
            delete this.onEnterFrame;
        } // end if
    } // end else if
};
_global.goonAI_mod = function ()
{
    this.gotoAndStop(this.state);
    if (this.health > 0)
    {
        this.range = Math.abs(this._x - _root.game.player._x);
        this.rangey = Math.abs(this._y - _root.game.player._y);
        if (this.range > 180 && this.rangey < 400)
        {
            if (this._x > _root.game.player._x)
            {
                this.dir = 1;
            }
            else if (this._x < _root.game.player._x)
            {
                this.dir = -1;
            } // end else if
        }
        else if (this.range < 200 && this.rangey < 400 && _root.playerAttacking && (this.dir == 1 && _root.playerDir == 1 && this._x < _root.game.player._x || this.dir == -1 && _root.playerDir == -1 && this._x > _root.game.player._x))
        {
            this.state = "attack";
            this.attackCount = 0;
            this.dir = this.dir * -1;
        }
        else if (this.range < 200 && this.rangey < 400 && this.state != "attack" && this.state != "hurt" && this.state != "fall" && this.attackCount > 10)
        {
            this.state = "attack";
            this.attackCount = 0;
        }
        else if (this.range < 75 && this.rangey < 400 && this.state != "attack" && this.state != "hurt" && this.state != "fall")
        {
            this.state = "retreat";
        } // end else if
        this._xscale = this.dir * Math.abs(this._xscale);
        if (this.state == "waiting")
        {
            if (this.range < 250)
            {
                this.state = "reveal";
            } // end if
        }
        else if (this.state == "stand")
        {
            ++this.attackCount;
            rand = Math.random() - Math.random();
            if (this.range < 240 && this.attackCount > 5 && rand > 7.000000E-001)
            {
                this.state = "attack";
                this.attackCount = 0;
            }
            else if (this.range < 150 && this.attackCount < 8)
            {
                rand = Math.random() - Math.random();
                if (rand > 0)
                {
                    this.attackCount = int(-Math.random() * 10);
                    if (rand > 5.000000E-001)
                    {
                        this.dir = this.dir * -1;
                    } // end if
                }
                else
                {
                    this.state = "run_start";
                } // end else if
            }
            else if (this.attackCount > Math.random() * 20 + 25 || this.range > 300)
            {
                this.state = "run_start";
            } // end else if
        }
        else if (this.state == "run" || this.state == "run_start")
        {
            if (!_global.checkWall(this, -50, this.speed * this.dir) && _global.checkEdge_boss(this, 50, this.speed * this.dir * 5))
            {
                this._x = this._x + this.speed * this.dir * -1;
                
            } // end if
            ++this.attackCount;
        }
        else if (this.state == "retreat")
        {
            if (!_global.checkWall(this, -50, -this.speed * this.dir) && _global.checkEdge_boss(this, 50, -this.speed * this.dir * 5))
            {
                this._x = this._x - this.speed * this.dir * -1;
            } // end if
            ++this.attackCount;
            if (this.attackCount > 5 || this.range > Math.random() * 100 + 250)
            {
                rand = Math.random() - Math.random();
                if (rand > 5.000000E-001)
                {
                    this.state = "run_start";
                }
                else
                {
                    this.state = "attack";
                    this.attackCount = 0;
                } // end if
            } // end else if
        }
        else if (this.state == "hurt")
        {
            if (!_global.checkWall(this, -50, -6 * this.dir))
            {
                this._x = this._x - 6 * this.dir * -1;
            } // end else if
        } // end else if
        if (_global.checkPlayer_boss(this, this.dir, -20))
        {
            _root.playerDx = 0;
            if (_root.playerAttacking && this.state != "hurt" && this.state != "fall" && this.range < 160)
            {
                this.invincible = true;
                if (_root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
                {
                    _root.kick.start();
                    this.health = this.health - 15;
                    this.state = "hurt";
                    fallCount = 0;
                }
                else if (_root.playerState == "highpunch" || _root.playerState == "lowpunch" || _root.playerState == "punch" || _root.playerState == "jumppunch")
                {
                    _root.punch2.start();
                    this.health = this.health - 15;
                    this.state = "hurt";
                    fallCount = 0;
                }
                else if (_root.playerState == "vert_highpunch" || _root.playerState == "vert_lowpunch" || _root.playerState == "vert_punch" || _root.playerState == "vert_jumppunch")
                {
                    _root.punch.start();
                    this.health = this.health - 15;
                    this.state = "hurt";
                    fallCount = 0;
                    
                } // end else if
                if (this.health <= 0)
                {
                    _root.score = _root.score + 100;
                    this.state = "die";
                    _root.hitCount = 0;
                } // end if
            }
            else if (this.state == "attack" && _root.playerState != "hurt" && !_root.playerInvincible)
            {
                _root.m_hurt.start();
                _root.playerState = "hurt";
                _root.playerHealth = _root.playerHealth - this.strength;
                _root.playerInvincible = true;
            }
            else if (this.state != "attack" && this.state != "hurt" && this.state != "fall" && this.attackCount > 10)
            {
                this.state = "attack";
                this.attackCount = 0;
                
            } // end else if
        }
        else if (_global.checkPlayer_boss(this, this.dir, 180))
        {
            _root.playerDx = 0;
            if (_root.playerAttacking && this.state != "hurt" && this.state != "fall")
            {
                if (_root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
                {
                    _root.kick.start();
                    this.health = this.health - 15;
                }
                else if (_root.playerState == "highpunch" || _root.playerState == "lowpunch" || _root.playerState == "punch" || _root.playerState == "jumppunch")
                {
                    _root.punch2.start();
                    this.health = this.health - 15;
                }
                else if (_root.playerState == "vert_highpunch" || _root.playerState == "vert_lowpunch" || _root.playerState == "vert_punch" || _root.playerState == "vert_jumppunch")
                {
                    _root.punch.start();
                    this.health = this.health - 15;
                } // end else if
                this.state = "hurt";
                this.invincible = true;
                fallCount = 0;
                if (this.health <= 0)
                {
                    _root.score = _root.score + 250;
                    this.state = "die";
                } // end if
            }
            else if (this.state == "attack" && _root.playerState != "hurt" && !_root.playerInvincible)
            {
                _root.m_hurt.start();
                _root.playerState = "hurt";
                _root.playerHealth = _root.playerHealth - this.strength;
                _root.playerInvincible = true;
            }
            else if (this.state != "attack" && this.state != "hurt" && this.state != "fall" && this.attackCount > 10)
            {
                this.state = "attack";
                this.attackCount = 0;
                
            } // end else if
        }
        else if (global.checkPlayer_boss(this, this.dir, 0))
        {
            
        } // end else if
    }
    else
    {
        if (!this.flash)
        {
            this.flash = 1;
            if (_root.playerState == "capespin" || _root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
            {
                _root.goon_die.start();
            }
            else
            {
                _root.goon_die_stab.start();
            } // end else if
            this.state = "die";
        }
        else
        {
            ++this.flash;
        } // end else if
        if (this.flash > 50)
        {
            if (this.flash % 4 < 2)
            {
                this._visible = false;
            }
            else
            {
                this._visible = true;
            } // end if
        } // end else if
        if (this.flash > 100)
        {
            this._visible = false;
            ++_root.eKills;
            delete this.onEnterFrame;
        } // end if
    } // end else if
};
_global.goonAI_mod2 = function ()
{
    this.gotoAndStop(this.state);
    if (this.health > 0)
    {
        this.range = Math.abs(this._x - _root.game.player._x);
        this.rangey = Math.abs(this._y - _root.game.player._y);
        if (this.range > 180 && this.rangey < 400)
        {
            if (this._x > _root.game.player._x)
            {
                this.dir = 1;
            }
            else if (this._x < _root.game.player._x)
            {
                this.dir = -1;
            } // end else if
        }
        else if (this.range < 200 && this.rangey < 400 && _root.playerAttacking && (this.dir == 1 && _root.playerDir == 1 && this._x < _root.game.player._x || this.dir == -1 && _root.playerDir == -1 && this._x > _root.game.player._x))
        {
            this.state = "attack";
            this.attackCount = 0;
            this.dir = this.dir * -1;
        }
        else if (this.range < 200 && this.rangey < 400 && this.state != "attack" && this.state != "hurt" && this.state != "fall" && this.attackCount > 10)
        {
            this.state = "attack";
            this.attackCount = 0;
        }
        else if (this.range < 75 && this.rangey < 400 && this.state != "attack" && this.state != "hurt" && this.state != "fall")
        {
            this.state = "retreat";
        } // end else if
        this._xscale = this.dir * Math.abs(this._xscale);
        if (this.state == "waiting")
        {
            if (this.range < 250)
            {
                this.state = "reveal";
            } // end if
        }
        else if (this.state == "stand")
        {
            ++this.attackCount;
            rand = Math.random() - Math.random();
            if (this.range < 240 && this.attackCount > 5 && rand > 7.000000E-001)
            {
                this.state = "attack";
                this.attackCount = 0;
            }
            else if (this.range < 150 && this.attackCount < 8)
            {
                rand = Math.random() - Math.random();
                if (rand > 0)
                {
                    this.attackCount = int(-Math.random() * 10);
                    if (rand > 5.000000E-001)
                    {
                        this.dir = this.dir * -1;
                    } // end if
                }
                else
                {
                    this.state = "run_start";
                } // end else if
            }
            else if (this.attackCount > Math.random() * 20 + 25 || this.range > 300)
            {
                this.state = "run_start";
            } // end else if
        }
        else if (this.state == "run" || this.state == "run_start")
        {
            if (!_global.checkWall(this, -50, this.speed * this.dir) && _global.checkEdge_boss(this, 50, this.speed * this.dir * 5))
            {
                this._x = this._x + this.speed * this.dir * -1;
                
            } // end if
            ++this.attackCount;
        }
        else if (this.state == "retreat")
        {
            if (!_global.checkWall(this, -50, -this.speed * this.dir) && _global.checkEdge_boss(this, 50, -this.speed * this.dir * 5))
            {
                this._x = this._x - this.speed * this.dir * -1;
            } // end if
            ++this.attackCount;
            if (this.attackCount > 5 || this.range > Math.random() * 100 + 250)
            {
                rand = Math.random() - Math.random();
                if (rand > 5.000000E-001)
                {
                    this.state = "run_start";
                }
                else
                {
                    this.state = "attack";
                    this.attackCount = 0;
                } // end if
            } // end else if
        }
        else if (this.state == "hurt")
        {
            if (!_global.checkWall(this, -50, -6 * this.dir))
            {
                this._x = this._x - 6 * this.dir * -1;
            } // end else if
        } // end else if
        if (_global.checkPlayer_boss(this, this.dir, -20))
        {
            _root.playerDx = 0;
            if (_root.playerAttacking && this.state != "hurt" && this.state != "fall" && this.range < 160)
            {
                this.invincible = true;
                if (_root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
                {
                    _root.kick.start();
                    this.health = this.health - 15;
                    this.state = "hurt";
                    fallCount = 0;
                }
                else if (_root.playerState == "highpunch" || _root.playerState == "lowpunch" || _root.playerState == "punch" || _root.playerState == "jumppunch")
                {
                    _root.punch2.start();
                    this.health = this.health - 15;
                    this.state = "hurt";
                    fallCount = 0;
                }
                else if (_root.playerState == "vert_highpunch" || _root.playerState == "vert_lowpunch" || _root.playerState == "vert_punch" || _root.playerState == "vert_jumppunch")
                {
                    _root.punch.start();
                    this.health = this.health - 15;
                    this.state = "hurt";
                    fallCount = 0;
                    
                } // end else if
                if (this.health <= 0)
                {
                    _root.score = _root.score + 100;
                    this.state = "die";
                    _root.hitCount = 0;
                } // end if
            }
            else if (this.state == "attack" && _root.playerState != "hurt" && !_root.playerInvincible)
            {
                _root.m_hurt.start();
                _root.playerState = "hurt";
                _root.playerHealth = _root.playerHealth - this.strength;
                _root.playerInvincible = true;
            }
            else if (this.state != "attack" && this.state != "hurt" && this.state != "fall" && this.attackCount > 10)
            {
                this.state = "attack";
                this.attackCount = 0;
                
            } // end else if
        }
        else if (_global.checkPlayer_boss(this, this.dir, 180))
        {
            _root.playerDx = 0;
            if (_root.playerAttacking && this.state != "hurt" && this.state != "fall")
            {
                if (_root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
                {
                    _root.kick.start();
                    this.health = this.health - 15;
                }
                else if (_root.playerState == "highpunch" || _root.playerState == "lowpunch" || _root.playerState == "punch" || _root.playerState == "jumppunch")
                {
                    _root.punch2.start();
                    this.health = this.health - 15;
                }
                else if (_root.playerState == "vert_highpunch" || _root.playerState == "vert_lowpunch" || _root.playerState == "vert_punch" || _root.playerState == "vert_jumppunch")
                {
                    _root.punch.start();
                    this.health = this.health - 15;
                } // end else if
                this.state = "hurt";
                this.invincible = true;
                fallCount = 0;
                if (this.health <= 0)
                {
                    _root.score = _root.score + 250;
                    this.state = "die";
                } // end if
            }
            else if (this.state == "attack" && _root.playerState != "hurt" && !_root.playerInvincible)
            {
                _root.m_hurt.start();
                _root.playerState = "hurt";
                _root.playerHealth = _root.playerHealth - this.strength;
                _root.playerInvincible = true;
            }
            else if (this.state != "attack" && this.state != "hurt" && this.state != "fall" && this.attackCount > 10)
            {
                this.state = "attack";
                this.attackCount = 0;
                
            } // end else if
        }
        else if (global.checkPlayer_boss(this, this.dir, 0))
        {
            
        } // end else if
    }
    else
    {
        if (!this.flash)
        {
            this.flash = 1;
            if (_root.playerState == "capespin" || _root.playerState == "kick" || _root.playerState == "highkick" || _root.playerState == "lowkick" || _root.playerState == "jumpkick")
            {
                _root.goon_die.start();
            }
            else
            {
                _root.goon_die_stab.start();
            } // end else if
            this.state = "die";
        }
        else
        {
            ++this.flash;
        } // end else if
        if (this.flash > 50)
        {
            if (this.flash % 4 < 2)
            {
                this._visible = false;
            }
            else
            {
                this._visible = true;
            } // end if
        } // end else if
        if (this.flash > 100)
        {
            this._visible = false;
            ++_root.eKills;
            delete this.onEnterFrame;
        } // end if
    } // end else if
};
_global.maidAI = function ()
{
    this.gotoAndStop(this.state);
    if (this.health > 0)
    {
        this.range = Math.abs(this._x - _root.game.player._x);
        this.rangey = Math.abs(this._y - _root.game.player._y);
        if (this.range > 180 && this.rangey < 400)
        {
            if (this._x > _root.game.player._x)
            {
                this.dir = -1;
            }
            else if (this._x < _root.game.player._x)
            {
                this.dir = 1;
            } // end else if
            this.attackCount = 0;
        }
        else if (this.range < 180 && this.rangey < 400 && _root.playerAttacking && (this.dir == 1 && _root.playerDir == 1 && this._x > _root.game.player._x || this.dir == -1 && _root.playerDir == -1 && this._x < _root.game.player._x))
        {
            this.state = "attack";
            this.attackCount = 0;
            this.dir = this.dir * -1;
        }
        else if (this.range < 80 && this.rangey < 400 && this.state != "attack" && this.state != "attack2" && this.state != "hurt" && this.state != "fall" && this.attackCount > 10)
        {
            this.state = "attack";
        }
        else if (this.range < 50 && this.rangey < 400 && this.state != "attack" && this.state != "attack2" && this.state != "hurt" && this.state != "fall")
        {
            this.state = "retreat";
        } // end else if
        this._xscale = this.dir * Math.abs(this._xscale);
        if (this.state == "idle")
        {
            if (this.range < 400 && this.rangey < 400)
            {
                this.state = "stand";
            } // end if
        }
        else if (this.state == "stand")
        {
            ++this.attackCount;
            this.rand = Math.random() - Math.random();
            if (this.range < 100 && this.attackCount > 5 && rand > 7.000000E-001)
            {
                this.state = "attack";
                this.attackCount = 0;
            }
            else if (this.range < 150 && this.attackCount < 8)
            {
                this.rand = Math.random() - Math.random();
                if (this.rand > 0)
                {
                    this.state = "retreat";
                    this.attackCount = int(-Math.random() * 10);
                    if (rand > 5.000000E-001)
                    {
                        this.dir = this.dir * -1;
                    } // end if
                }
                else
                {
                    this.state = "walk";
                } // end else if
            }
            else if (this.range > 180)
            {
                this.state = "walk";
            } // end else if
        }
        else if (this.state == "walk")
        {
            if (!_global.checkWall(this, -50, this.speed * this.dir) && _global.checkEdge(this, 50, this.speed * this.dir * 5))
            {
                this._x = this._x + this.speed * this.dir;
            } // end if
            ++this.attackCount;
            if (this.range > 180 && this.rangey < 220 && this.attackCount < 2 && !this.whipped)
            {
                this.state = "attack2";
            } // end if
        }
        else if (this.state == "retreat")
        {
            if (!_global.checkWall(this, -50, -this.speed * this.dir) && _global.checkEdge(this, 50, -this.speed * this.dir * 5))
            {
                this._x = this._x - this.speed * this.dir;
            } // end if
            ++this.attackCount;
            if (this.attackCount > 5 || this.range > Math.random() * 100 + 250)
            {
                rand = Math.random() - Math.random();
                if (rand > 0)
                {
                    this.state = "walk";
                }
                else if (!this.whipped)
                {
                    this.state = "attack2";
                }
                else
                {
                    this.state = "attack";
                } // end else if
            } // end else if
        }
        else if (this.state == "attack2")
        {
            if (this.range < 400)
            {
                if (this.maid.hitBox.hitTest(_root.game.player) && this.attackCount < 2 && _root.playerState != "hurt" && !_root.playerInvincible && !this.whipped)
                {
                    this.whipped = true;
                    _root.punch.start();
                    _root.playerState = "hurt";
                    _root.playerHealth = _root.playerHealth - this.strength;
                    _root.playerInvincible = true;
                    ++this.attackCount;
                } // end if
            }
            else
            {
                this.state = "stand";
            } // end else if
        }
        else if (this.state == "hurt")
        {
            if (!_global.checkWall(this, -50, -6 * this.dir))
            {
                this._x = this._x - 6 * this.dir;
            } // end if
        }
        else if (this.state == "fall" && fallCount < 6)
        {
            if (!_global.checkWall(this, -50, -10 * this.dir))
            {
                this._x = this._x - 10 * this.dir;
            } // end if
            ++this.fallCount;
        } // end else if
        if (_global.checkBatarang(this))
        {
            if (this.state != "hurt" && this.state != "fall")
            {
                this.health = this.health - 5;
                this.state = "hurt";
                _root.kick.start();
            } // end if
            if (this.health <= 0)
            {
                _root.score = _root.score + 100;
                this.state = "die";
                _root.hitCount = 0;
            } // end if
        } // end if
        if (_global.checkPlayer(this, this.dir, -20))
        {
            _root.playerDx = 0;
            if (_root.playerAttacking && this.state != "hurt" && this.state != "fall")
            {
                this.whipped = false;
                if (_root.playerState == "lowkick")
                {
                    _root.kick.start();
                    this.health = this.health - 15;
                    this.state = "fall";
                    fallCount = 0;
                }
                else if (_root.playerState == "highpunch")
                {
                    _root.punch2.start();
                    this.health = this.health - 15;
                    this.state = "fall";
                    fallCount = 0;
                }
                else if (_root.playerState == "highkick")
                {
                    _root.kick.start();
                    this.health = this.health - 15;
                    this.state = "fall";
                    fallCount = 0;
                }
                else
                {
                    _root.punch.start();
                    this.health = this.health - 10;
                    this.state = "hurt";
                } // end else if
                ++_root.hitCount;
                _root.comboCount = 10;
                if (_root.hitCount > 2)
                {
                    _root.comboMeter = true;
                } // end if
                if (this.health <= 0)
                {
                    _root.score = _root.score + 100;
                    this.state = "die";
                    _root.hitCount = 0;
                } // end if
            }
            else if (this.state == "attack" && _root.playerState != "hurt" && !_root.playerInvincible)
            {
                _root["metal" + Math.ceil(Math.random() * 3)].start();
                _root.playerState = "hurt";
                _root.playerHealth = _root.playerHealth - this.strength;
                _root.playerInvincible = true;
            }
            else if (this.state != "attack" && this.state != "hurt" && this.state != "fall" && this.attackCount > 10)
            {
                this.state = "attack";
                this.attackCount = 0;
            } // end else if
        }
        else if (_global.checkPlayer(this, this.dir, -120))
        {
            _root.playerDx = 0;
            if (_root.playerAttacking && this.state != "hurt" && this.state != "fall")
            {
                _root.punch2.start();
                this.health = this.health - 20;
                this.state = "fall";
                fallCount = 0;
                if (this.health <= 0)
                {
                    _root.score = _root.score + 100;
                    this.state = "die";
                    _root.hitCount = 0;
                } // end if
                ++_root.hitCount;
                _root.comboCount = 10;
                if (_root.hitCount > 2)
                {
                    _root.comboMeter = true;
                } // end if
            } // end if
        } // end else if
    }
    else
    {
        if (!this.flash)
        {
            this.flash = 1;
            _root.goon_die.start();
            this.state = "die";
        }
        else
        {
            ++this.flash;
        } // end else if
        if (this.flash > 50)
        {
            if (this.flash % 4 < 2)
            {
                this._visible = false;
            }
            else
            {
                this._visible = true;
            } // end if
        } // end else if
        if (this.flash > 100)
        {
            this._visible = false;
            ++_root.eKills;
            delete this.onEnterFrame;
        } // end if
    } // end else if
};
_global.penguinAI = function ()
{
    this.gotoAndStop(this.state);
    if (this.health > 0)
    {
        if (this._x > 2300)
        {
            this.dir = 1;
            this.state = "dodge";
            this.dy = -12;
        }
        else if (this._x < 0)
        {
            this.dir = -1;
            this.state = "dodge";
            this.dy = -12;
        } // end else if
        if (this.state != "dodge")
        {
            if (Math.abs(this._y - this.enemy_y) > 5)
            {
                this._y = this._y - (this._y - this.enemy_y) * 3.000000E-001;
            }
            else
            {
                this._y = this.enemy_y;
            } // end if
        } // end else if
        this.range = Math.abs(this._x - _root.game.player._x);
        if (this.range > 180 && this.range < 320)
        {
            if (this.state != "dodge")
            {
                if (this._x > _root.game.player._x)
                {
                    this.dir = -1;
                }
                else if (this._x < _root.game.player._x)
                {
                    this.dir = 1;
                } // end else if
                if (this.attackCount < 3 && this.state != "attack2" && this.state != "hurt" && this.state != "fall" && this.state != "dodge" && this.state != "block")
                {
                    this.state = "attack2";
                    ++this.attackCount;
                } // end if
            } // end if
        }
        else if (this.range < 180 && (this.dir == 1 && _root.playerDir == 1 && this._x > _root.game.player._x || this.dir == -1 && _root.playerDir == -1 && this._x < _root.game.player._x))
        {
            this.dir = this.dir * -1;
        } // end else if
        if (this.range > 360)
        {
            if (this._x > _root.game.player._x)
            {
                this.dir = -1;
            }
            else if (this._x < _root.game.player._x)
            {
                this.dir = 1;
            } // end else if
            this.attackCount = 0;
        } // end if
        this._xscale = this.dir * Math.abs(this._xscale);
        if (this.state == "walk")
        {
            if (!_global.checkWall(this, -50, this.speed * this.dir))
            {
                this._x = this._x + this.speed * this.dir;
            } // end if
        }
        else if (this.state == "dodge")
        {
            if (this._y <= this.enemy_y)
            {
                this._y = this._y + this.dy;
                this.dy = this.dy + _root.globalGravity;
                if (this._x > 2100)
                {
                    this.dir = 1;
                    this._x = this._x - 15 * this.dir;
                }
                else if (this._x < 100)
                {
                    this.dir = -1;
                    this._x = this._x - 15 * this.dir;
                }
                else if (!_global.checkWall(this, -50, this.speed * -this.dir))
                {
                    this._x = this._x - 15 * this.dir;
                } // end else if
            }
            else
            {
                this.dy = 0;
                this._y = this.enemy_y;
                this.state = "stand";
            } // end else if
            ++this.fallCount;
            if (this.fallCount >= 20)
            {
                this.dy = 0;
                this._y = this.enemy_y;
                this.state = "stand";
            } // end if
        }
        else if (this.state == "hurt")
        {
            if (!_global.checkWall(this, -50, this.speed * this.dir))
            {
                this._x = this._x - 6 * this.dir;
            } // end if
        }
        else if (this.state == "fall" && this.fallCount < 6)
        {
            if (!_global.checkWall(this, -50, this.speed * this.dir))
            {
                this._x = this._x - 6 * this.dir;
            } // end if
            ++this.fallCount;
        }
        else if (this.state == "attack2")
        {
            if (_root.game.player.hitTest(this.laser.hitBox))
            {
                if (!done)
                {
                    done = true;
                    if (_root.playerState != "capespin" && _root.playerState != "electro" && !_root.playerInvincible)
                    {
                        _root.playerState = "electro";
                        _root.playerHealth = _root.playerHealth - this.stength;
                    } // end if
                } // end if
            }
            else
            {
                done = false;
            } // end else if
        } // end else if
        if (_global.checkBatarang(this))
        {
            if (this.state != "hurt" && this.state != "fall" && this.state != "block" && this.state != "dodge")
            {
                if (this._x > _root.game.player._x)
                {
                    this.dir = -1;
                }
                else if (this._x < _root.game.player._x)
                {
                    this.dir = 1;
                } // end else if
                rand = Math.random() * 5;
                if (rand > 2)
                {
                    this.state = "block";
                }
                else
                {
                    this.health = this.health - 5;
                    this.state = "hurt";
                    if (this.health <= 0)
                    {
                        _root.score = _root.score + 500;
                        this.state = "die";
                    } // end if
                } // end if
            } // end if
        } // end else if
        if (_global.checkPlayer(this, this.dir))
        {
            _root.playerDx = 0;
            if (_root.playerAttacking && this.state != "hurt" && this.state != "fall" && this.state != "attack")
            {
                if (_root.playerState == "lowkick")
                {
                    this.health = this.health - 15;
                    this.state = "fall";
                    this.fallCount = 0;
                    _root.kick.start();
                    ++_root.hitCount;
                    _root.comboCount = 50;
                    if (_root.hitCount > 2)
                    {
                        _root.comboMeter = true;
                    } // end if
                }
                else if (_root.playerState == "punch" || _root.playerState == "lowpunch" || _root.playerState == "kick")
                {
                    this.health = this.health - 10;
                    this.state = "hurt";
                    _root.punch.start();
                    ++_root.hitCount;
                    _root.comboCount = 50;
                    if (_root.hitCount > 2)
                    {
                        _root.comboMeter = true;
                    } // end if
                } // end else if
                if (this.health <= 0)
                {
                    _root.score = _root.score + 500;
                    this.state = "die";
                } // end if
            }
            else if ((this.state == "attack" || this.state == "attack2") && _root.playerState != "hurt" && _root.playerState != "fall" && !_root.playerInvincible)
            {
                _root.playerState = "hurt";
                _root.playerHealth = _root.playerHealth - this.stength;
                _root.playerInvincible = true;
            }
            else if (this.state != "dodge" && this.state != "attack" && this.state != "attack2" && this.state != "hurt" && this.state != "fall")
            {
                this.state = "attack";
                this.fallCount = 0;
            } // end else if
        }
        else if (_global.checkPlayer(this, this.dir, -120))
        {
            _root.playerDx = 0;
            if (_root.playerAttacking && this.state != "hurt" && this.state != "fall" && this.state != "dodge" && this.state != "attack" && this.state != "attack2")
            {
                _root.punch2.start();
                this.health = this.health - 20;
                this.state = "fall";
                this.fallCount = 0;
                if (this.health <= 0)
                {
                    _root.score = _root.score + 100;
                    this.state = "die";
                } // end if
                ++_root.hitCount;
                _root.comboCount = 10;
                if (_root.hitCount > 2)
                {
                    _root.comboMeter = true;
                } // end if
            } // end if
        }
        else if (!_global.checkWall(this, this.enemyHeight) && this.state != "dodge" && this.state != "block" && this.state != "attack" && this.state != "attack2" && this.state != "hurt" && this.state != "fall")
        {
            this.state = "walk";
        } // end else if
    }
    else
    {
        _root.gotoLast = "start";
        _root.gotoNext = "card:escape";
        _root.fadeout.play();
        if (!bammed)
        {
            _root.bam.start();
            bammed = true;
        } // end if
    } // end else if
};
_global.kabukiAI = function ()
{
    this.gotoAndStop(this.state);
    if (this.health > 0)
    {
        this.range = Math.abs(this._x - _root.game.player._x);
        if (this.range > 180 && this.range < 240)
        {
            if (this._x > _root.game.player._x)
            {
                this.dir = -1;
            }
            else if (this._x < _root.game.player._x)
            {
                this.dir = 1;
            } // end else if
        }
        else if (this.range < 180 && this.state != "jumpOver" && _root.playerAttacking && (this.dir == 1 && _root.playerDir == 1 && this._x > _root.game.player._x || this.dir == -1 && _root.playerDir == -1 && this._x < _root.game.player._x))
        {
            this.state = "attack";
            this.attackCount = 0;
            this.dir = this.dir * -1;
        }
        else if (this.range < 80 && this.state != "attack" && this.state != "hurt" && this.state != "fall" && this.state == "jump" && this.state != "jumpOver" && this.attackCount > 10)
        {
            this.state = "attack";
            this.attackCount = 0;
        }
        else if (this.range < 50 && this.state != "attack" && this.state != "hurt" && this.state != "fall" && this.state != "jumpOver")
        {
            this.state = "retreat";
        } // end else if
        this._xscale = this.dir * Math.abs(this._xscale);
        if (this.state == "idle")
        {
            if (this.range < 320)
            {
                this.state = "greet";
            } // end if
        }
        else if (this.state == "stand")
        {
            ++this.attackCount;
            this.attackCount = this.attackCount - random(1);
            rand = Math.random() - Math.random();
            if (this.range < 100 && this.attackCount > 15 && rand > 7.000000E-001)
            {
                this.state = "attack";
                this.attackCount = 0;
            }
            else if (this.range < 150 && this.attackCount < 18)
            {
                rand = Math.random() - Math.random();
                if (rand > 5.000000E-001)
                {
                    this.state = "retreat";
                    this.attackCount = int(-Math.random() * 30);
                    if (rand > 5.000000E-001)
                    {
                        this.dir = this.dir * -1;
                    } // end if
                }
                else
                {
                    this.state = "walk";
                } // end else if
            }
            else if (this.attackCount > Math.random() * 20 + 25 || this.range > 300)
            {
                this.state = "walk";
            } // end else if
        }
        else if (this.state == "walk")
        {
            this._x = this._x + this.speed * this.dir;
            ++this.attackCount;
        }
        else if (this.state == "retreat")
        {
            this._x = this._x - this.speed * this.dir * 1.300000E+000;
            if (this._x > this.xMax)
            {
                this._x = this._x - (this._x - this.xMax) / 2;
                this.state = "jumpOver";
                this.dy = 32;
            }
            else if (this._x < this.xMin)
            {
                this._x = this._x - (this._x - this.xMin) / 2;
                this.state = "jumpOver";
                this.dy = 32;
            } // end else if
            ++this.attackCount;
            if (this.attackCount > 25 || this.range > Math.random() * 100 + 250)
            {
                rand = Math.random() - Math.random();
                if (rand > 0)
                {
                    this.state = "walk";
                }
                else
                {
                    this.state = "jump";
                    this.dy = 32;
                } // end if
            } // end else if
        }
        else if (this.state == "duck")
        {
            if (this.jumping)
            {
                this._x = this._x - this.speed * this.dir;
                if (this._x > this.xMax)
                {
                    this._x = this._x - (this._x - this.xMax) / 2;
                }
                else if (this._x < this.xMin)
                {
                    this._x = this._x - (this._x - this.xMin) / 2;
                } // end if
            } // end else if
        }
        else if (this.state == "jump")
        {
            if (this.jumping)
            {
                this._x = this._x - this.speed * this.dir * -1.400000E+000;
                this._y = this._y - this.dy;
                this.dy = this.dy - 3;
                if (this._y > this.ground)
                {
                    this.state = "land";
                    this.jumping = false;
                    this._y = this.ground;
                } // end if
                if (this._x > this.xMax)
                {
                    this._x = this._x - (this._x - this.xMax) / 2;
                }
                else if (this._x < this.xMin)
                {
                    this._x = this._x - (this._x - this.xMin) / 2;
                } // end if
            } // end else if
        }
        else if (this.state == "jumpOver")
        {
            if (this.jumping)
            {
                this._x = this._x - this.speed * this.dir * -1.800000E+000;
                this._y = this._y - this.dy;
                this.dy = this.dy - 3;
                if (this._y > this.ground)
                {
                    this.state = "land";
                    this.jumping = false;
                    this._y = this.ground;
                } // end if
                if (this._x > this.xMax)
                {
                    this._x = this._x - (this._x - this.xMax) / 2;
                }
                else if (this._x < this.xMin)
                {
                    this._x = this._x - (this._x - this.xMin) / 2;
                } // end if
            } // end else if
        }
        else if (this.state == "hurt")
        {
            if (this._x < this.xMax && this._x > this.xMin)
            {
                this._x = this._x - 12 * this.dir;
            }
            else if (this._x > this.xMax)
            {
                this._x = this._x - (this._x - this.xMax) / 2;
                this.state = "jumpOver";
                this.dy = 32;
            }
            else if (this._x < this.xMin)
            {
                this._x = this._x - (this._x - this.xMin) / 2;
                this.state = "jumpOver";
                this.dy = 32;
            } // end else if
        }
        else if (this.state == "fall" && fallCount < 6)
        {
            if (this._x < this.xMax && this._x > this.xMin)
            {
                this._x = this._x - 10 * this.dir;
                ++this.fallCount;
            }
            else if (this._x > this.xMax)
            {
                this._x = this._x - (this._x - this.xMax) / 2;
            }
            else if (this._x < this.xMin)
            {
                this._x = this._x - (this._x - this.xMin) / 2;
            } // end else if
        } // end else if
        if (this.state != "jump")
        {
            if (this._y < this.ground)
            {
                this._y = this._y - (this._y - this.ground) * 3.000000E-001;
                if (this.ground - this._y < 1)
                {
                    this.jumping = false;
                    this._y = this.ground;
                } // end if
            } // end if
        } // end if
        if (_global.checkBatarang(this))
        {
            if (this.state != "hurt" && this.state != "fall" && this.state != "retreat" && this.state != "duck" && this.state != "block" && this.state != "jumpOver" && this.state != "idle" && this.state != "greet")
            {
                rand = random(10);
                if (rand > 6)
                {
                    this.state = "block";
                }
                else if (rand > 3)
                {
                    this.state = "duck";
                }
                else
                {
                    this.health = this.health - 5;
                    this.state = "fall";
                    _root.kick.start();
                } // end else if
            } // end else if
            if (this.health <= 0)
            {
                _root.score = _root.score + 100;
                this.state = "die";
            } // end if
        } // end if
        if (_global.checkPlayer(this, this.dir, -20))
        {
            _root.playerDx = 0;
            if (this.state != "jumpOver" && this.state != "idle" && this.state != "greet")
            {
                if (_root.playerAttacking && this.state != "hurt" && this.state != "fall")
                {
                    this.invincible = true;
                    if (_root.playerState == "lowkick")
                    {
                        _root.kick.start();
                        this.health = this.health - 15;
                        this.state = "fall";
                        fallCount = 0;
                    }
                    else if (_root.playerState == "highpunch" && this.state != "duck")
                    {
                        rand = random(5);
                        if (rand > 2)
                        {
                            this.state = "duck";
                        }
                        else
                        {
                            _root.punch2.start();
                            this.health = this.health - 15;
                            this.state = "fall";
                            fallCount = 0;
                        } // end else if
                    }
                    else if (_root.playerState == "highkick" && this.state != "duck")
                    {
                        rand = random(5);
                        if (rand > 2)
                        {
                            this.state = "duck";
                        }
                        else
                        {
                            _root.kick.start();
                            this.health = this.health - 15;
                            this.state = "fall";
                            fallCount = 0;
                        } // end else if
                    }
                    else if (_root.playerState == "punch" && this.state != "duck")
                    {
                        rand = random(5);
                        if (rand > 2)
                        {
                            this.state = "duck";
                        }
                        else
                        {
                            _root.kick.start();
                            this.health = this.health - 10;
                            this.state = "hurt";
                            fallCount = 0;
                        } // end else if
                    }
                    else
                    {
                        _root.punch.start();
                        this.health = this.health - 10;
                        this.state = "hurt";
                    } // end else if
                    ++_root.hitCount;
                    _root.comboCount = 50;
                    if (_root.hitCount > 2)
                    {
                        _root.comboMeter = true;
                    } // end if
                    if (this.health <= 0)
                    {
                        _root.score = _root.score + 100;
                        this.state = "die";
                        _root.hitCount = 0;
                    } // end if
                }
                else if (this.state == "attack" && _root.playerState != "hurt" && !_root.playerInvincible)
                {
                    _root["metal" + Math.ceil(Math.random() * 3)].start();
                    _root.playerState = "hurt";
                    _root.playerHealth = _root.playerHealth - this.strength;
                    _root.playerInvincible = true;
                }
                else if (this.state != "attack" && this.state != "hurt" && this.state != "fall" && this.state != "jump" && this.state != "jumpOver" && this.attackCount > 10)
                {
                    this.state = "attack";
                    this.attackCount = 0;
                } // end else if
            }
            else if (_global.checkPlayer(this, this.dir, -160))
            {
                _root.playerDx = 0;
                if (_root.playerAttacking && this.state != "hurt" && this.state != "fall" && this.state != "jumpOver")
                {
                    _root.punch2.start();
                    this.health = this.health - 20;
                    this.state = "fall";
                    this.invincible = true;
                    fallCount = 0;
                    if (this.health <= 0)
                    {
                        _root.score = _root.score + 100;
                        this.state = "die";
                    } // end if
                } // end if
            } // end else if
        }
        else if (!_global.checkWall(this, this._height) && this.state != "attack" && this.state != "hurt" && this.state != "fall")
        {
        }
        else if (this.state != "attack" && this.state != "hurt" && this.state != "fall")
        {
            if (this.dir > 0)
            {
                
            } // end else if
        } // end else if
    }
    else
    {
        this.gotoAndStop("die");
        if (this._y < this.ground)
        {
            this._y = this._y - (this._y - this.ground) * 3.000000E-001;
            if (this.ground - this._y < 1)
            {
                this.jumping = false;
                this._y = this.ground;
            } // end if
        } // end if
        if (!this.flash)
        {
            this.flash = 1;
            _root.bam.start();
        }
        else
        {
            ++this.flash;
        } // end else if
        if (this.flash > 60)
        {
            if (this.flash % 6 < 3)
            {
                this._visible = false;
            }
            else
            {
                this._visible = true;
            } // end if
        } // end else if
        if (this.flash > 100)
        {
            this._visible = false;
            delete this.onEnterFrame;
        } // end if
    } // end else if
};
_global.roboAI = function ()
{
    this.gotoAndStop(this.state);
    var _loc4 = Math.ceil((300 - this.health) / 50) + 1;
    if (_loc4 > this.robo.glass._currentframe)
    {
        this.robo.glass.gotoAndStop(_loc4);
    } // end if
    if (this.health > 0)
    {
        this.range = Math.abs(this._x - _root.game.player._x);
        if (this.range > 180 && this.range < 240)
        {
            if (this.state != "attack" && this.state != "attack2" && this.state != "attack3")
            {
                if (this._x > _root.game.player._x)
                {
                    this.dir = -1;
                }
                else if (this._x < _root.game.player._x)
                {
                    this.dir = 1;
                } // end else if
                var _loc5 = random(10);
                if (_loc5 > 3)
                {
                    this.state = "attack";
                    this.attackCount = 0;
                }
                else if (_loc5 > 7)
                {
                    this.state = "attack2";
                    this.attackCount = 0;
                }
                else
                {
                    this.state = "retreat";
                } // end else if
            } // end else if
        }
        else if (this.range > 240 && this.state == "stand" && this.state != "attack" && this.state != "attack2" && this.state != "attack3")
        {
            if (this._x > _root.game.player._x)
            {
                this.dir = -1;
            }
            else if (this._x < _root.game.player._x)
            {
                this.dir = 1;
            } // end else if
            _loc5 = random(10);
            if (_loc5 > 3)
            {
                this.state = "attack2";
                this.attackCount = 0;
            }
            else if (_loc5 > 8)
            {
                this.state = "attack3";
                this.attackCount = 0;
                this.dx = 2;
            } // end else if
        }
        else if (this.range < 180 && _root.playerAttacking && (this.dir == 1 && _root.playerDir == 1 && this._x > _root.game.player._x || this.dir == -1 && _root.playerDir == -1 && this._x < _root.game.player._x))
        {
            this.state = "attack";
            this.attackCount = 0;
            this.dir = this.dir * -1;
        }
        else if (this.range < 80 && this.state != "attack" && this.state != "attack2" && this.state != "attack3" && this.state != "hurt" && this.attackCount > 10)
        {
            _loc5 = random(10);
            if (_loc5 > 5)
            {
                this.state = "attack";
                this.attackCount = 0;
            }
            else
            {
                this.state = "retreat";
            } // end else if
        }
        else if (this.range < 50 && this.state != "attack" && this.state != "attack2" && this.state != "attack3" && this.state != "hurt")
        {
            this.state = "retreat";
        } // end else if
        if (this.range > 400)
        {
            if (this._x > _root.game.player._x)
            {
                this.dir = -1;
            }
            else if (this._x < _root.game.player._x)
            {
                this.dir = 1;
            } // end if
        } // end else if
        this._xscale = this.dir * Math.abs(this._xscale);
        if (this.state == "idle")
        {
            if (this.range < 320)
            {
                this.state = "attack";
            } // end if
        }
        else if (this.state == "stand")
        {
            ++this.attackCount;
            this.attackCount = this.attackCount - random(1);
            _loc5 = Math.random() - Math.random();
            if (this.range < 100 && this.attackCount > 15 && _loc5 > 7.000000E-001)
            {
                this.state = "attack";
                this.attackCount = 0;
            }
            else if (this.range < 150 && this.attackCount < 18)
            {
                _loc5 = Math.random() - Math.random();
                if (_loc5 > 5.000000E-001)
                {
                    this.state = "retreat";
                    this.attackCount = int(-Math.random() * 30);
                    if (_loc5 > 5.000000E-001)
                    {
                        this.dir = this.dir * -1;
                    } // end if
                }
                else
                {
                    this.state = "walk";
                } // end else if
            }
            else if (this.attackCount > Math.random() * 20 + 25 || this.range > 300)
            {
                this.state = "walk";
            } // end else if
        }
        else if (this.state == "walk")
        {
            this._x = this._x + this.speed * this.dir;
            ++this.attackCount;
        }
        else if (this.state == "retreat")
        {
            this._x = this._x - this.speed * this.dir * 1.300000E+000;
            if (this._x > this.xMax)
            {
                this.dir = -1;
                this.state = "attack3";
                this.dx = 2;
            }
            else if (this._x < this.xMin)
            {
                this.dir = 1;
                this.state = "attack3";
                this.dx = 2;
            }
            else
            {
                this.state = "attack";
                this.attackCount = 0;
            } // end else if
            ++this.attackCount;
            if (this.attackCount > 25 || this.range > Math.random() * 100 + 250)
            {
                _loc5 = Math.random() - Math.random();
                if (_loc5 > 0)
                {
                    this.state = "walk";
                } // end if
            } // end if
        }
        else if (this.state == "attack3")
        {
            if (this.roboFlying)
            {
                if (this.dx > 0)
                {
                    if (this._x > 100 && this._x < 2100)
                    {
                        this._x = this._x + (this.speed + this.dx) * this.dir;
                    }
                    else if (this._x < 100)
                    {
                        this.dir = 1;
                        this._x = this._x + (this.speed + this.dx) * this.dir;
                    }
                    else if (this._x > 2100)
                    {
                        this.dir = -1;
                        this._x = this._x + (this.speed + this.dx) * this.dir;
                    } // end else if
                    if (flipped)
                    {
                        this.dx = this.dx - 4;
                    }
                    else
                    {
                        this.dx = this.dx + 3;
                    } // end else if
                    if ((this.dx > 100 || this.dx < -100 || this.range > 1000) && !flipped)
                    {
                        flipped = true;
                        this.dir = this.dir * -1;
                    } // end if
                }
                else if (flipped)
                {
                    flipped = false;
                    this.dx = 0;
                    this.robo.play();
                    this.roboFlying = false;
                } // end if
            } // end else if
            if (this.hitTest(_root.game.player) && !_root.playerInvincible && _root.playerState != "hurt")
            {
                _root["metal" + Math.ceil(Math.random() * 3)].start();
                _root.playerState = "hurt";
                _root.playerHealth = _root.playerHealth - this.strength;
                _root.playerInvincible = true;
            } // end if
        }
        else if (this.state == "hurt")
        {
            if (this._x < this.xMax && this._x > this.xMin)
            {
                this._x = this._x - 8 * this.dir;
            }
            else if (this._x > this.xMax)
            {
                this._x = this._x - (this._x - this.xMax) / 2;
            }
            else if (this._x < this.xMin)
            {
                this._x = this._x - (this._x - this.xMin) / 2;
            } // end else if
        } // end else if
        if (this.hitTest(_root.game.player))
        {
            if ((_root.playerState == "jumppunch" || _root.playerState == "jumpkick") && _root.playerAttacking && _root.playerJumping && this.state != "hurt" && this.state != "attack2" && this.state != "attack3" && this.state != "idle")
            {
                this.health = this.health - 5;
                this.state = "hurt";
                _root["metal" + Math.ceil(Math.random() * 3)].start();
                if (this.health <= 0)
                {
                    _root.score = _root.score + 3000;
                    this.state = "die";
                } // end if
            } // end if
        } // end if
        if (this.robo.hitBox.hitTest(_root.game.player) && (this.state == "attack" || this.state == "attack2") && _root.playerState != "hurt" && !_root.playerInvincible)
        {
            _root["metal" + Math.ceil(Math.random() * 3)].start();
            _root.playerState = "hurt";
            _root.playerHealth = _root.playerHealth - this.strength;
            _root.playerInvincible = true;
        } // end if
        if (_global.checkBatarang(this))
        {
            if (this.state != "hurt" && this.state != "attack" && this.state != "attack2" && this.state != "attack3" && this.state != "block" && this.state != "idle")
            {
                _loc5 = random(10);
                if (_loc5 > 3)
                {
                    this.state = "block";
                    _root["metal" + Math.ceil(Math.random() * 3)].start();
                }
                else
                {
                    this.health = this.health - 5;
                    this.state = "hurt";
                    _root["metal" + Math.ceil(Math.random() * 3)].start();
                } // end if
            } // end else if
            if (this.health <= 0)
            {
                _root.score = _root.score + 3000;
                this.state = "die";
            } // end if
        } // end if
        if (_global.checkPlayer(this, this.dir, -20))
        {
            _root.playerDx = 0;
            if (this.state != "idle" && !(this.state == "attack" && this.robo._currentframe > 6) && this.state != "attack2" && this.state != "attack3")
            {
                if (_root.playerAttacking && this.state != "hurt")
                {
                    this.invincible = true;
                    if (_root.playerState == "lowkick")
                    {
                        _root["metal" + Math.ceil(Math.random() * 3)].start();
                        this.health = this.health - 15;
                        this.state = "hurt";
                        fallCount = 0;
                    }
                    else if (_root.playerState == "highpunch")
                    {
                        _root["metal" + Math.ceil(Math.random() * 3)].start();
                        this.health = this.health - 15;
                        this.state = "hurt";
                        fallCount = 0;
                    }
                    else if (_root.playerState == "highkick")
                    {
                        _root["metal" + Math.ceil(Math.random() * 3)].start();
                        this.health = this.health - 15;
                        this.state = "hurt";
                        fallCount = 0;
                    }
                    else
                    {
                        _root["metal" + Math.ceil(Math.random() * 3)].start();
                        this.health = this.health - 10;
                        this.state = "hurt";
                    } // end else if
                    ++_root.hitCount;
                    _root.comboCount = 50;
                    if (_root.hitCount > 2)
                    {
                        _root.comboMeter = true;
                    } // end if
                    if (this.health <= 0)
                    {
                        _root.score = _root.score + 3000;
                        this.state = "die";
                        _root.hitCount = 0;
                    } // end if
                } // end if
                if ((this.state == "attack" || this.state == "attack2" || this.state == "attack3") && _root.playerState != "hurt" && !_root.playerInvincible)
                {
                    _root["metal" + Math.ceil(Math.random() * 3)].start();
                    _root.playerState = "hurt";
                    _root.playerHealth = _root.playerHealth - this.strength;
                    _root.playerInvincible = true;
                }
                else if (this.state != "attack" && this.state == "attack2" && this.state == "attack3" && this.state != "hurt" && this.attackCount > 10)
                {
                    this.state = "attack";
                    this.attackCount = 0;
                } // end else if
            }
            else if (_global.checkPlayer(this, this.dir, -100))
            {
                _root.playerDx = 0;
                if (_root.playerAttacking && this.state != "hurt")
                {
                    _root.punch2.start();
                    this.health = this.health - 20;
                    this.state = "hurt";
                    this.invincible = true;
                    if (this.health <= 0)
                    {
                        _root.score = _root.score + 3000;
                        this.state = "die";
                    } // end if
                } // end if
            } // end else if
        }
        else if (!_global.checkWall(this, this._height) && this.state != "attack" && this.state != "hurt")
        {
        }
        else if (this.state != "attack" && this.state != "hurt")
        {
            if (this.dir > 0)
            {
                
            } // end else if
        } // end else if
    }
    else
    {
        if (!this.flash)
        {
            this.gotoAndStop("die");
            this.flash = 1;
        }
        else
        {
            ++this.flash;
        } // end else if
        if (this.flash > 100)
        {
            _root.gotoNext = "card:end";
            _root.fadeout.play();
            if (!played)
            {
                _root.ignition.start();
                played = true;
            } // end if
            this._visible = true;
            delete this.onEnterFrame;
        } // end if
    } // end else if
};
_global.birdAI = function ()
{
    this._xscale = this.dir * Math.abs(this._xscale);
    this.range = Math.abs(this._x - _root.game.player._x);
    if (this.range > 180 && this.range < 240 && this.state != "die")
    {
        if (this.turnBack)
        {
            this.turnBack = false;
            this.state = "fly";
            if (this._x > _root.game.player._x)
            {
                this.dir = -1;
            }
            else if (this._x < _root.game.player._x)
            {
                this.dir = 1;
            } // end if
        } // end else if
    }
    else if (this.range < 180 && _root.playerAttacking && (this.dir == 1 && _root.playerDir == 1 && this._x > _root.game.player._x || this.dir == -1 && _root.playerDir == -1 && this._x < _root.game.player._x))
    {
        this.dir = this.dir * -1;
    }
    else if (this.range > 500)
    {
        if (this._x > _root.game.player._x)
        {
            this.dir = -1;
        }
        else if (this._x < _root.game.player._x)
        {
            this.dir = 1;
        } // end else if
    }
    else if (this.range > 320 && this.state != "die")
    {
        this.state = "glide";
        this.attackCount = 0;
    } // end else if
    this.gotoAndStop(this.state);
    if (this.state == "fly")
    {
        this._x = this._x + (random(this.speed) + this.speed) * this.dir;
        this._y = this._y - (random(9) - random(6) + (this._y - _root.game.player._y + 45) / 16);
        ++this.flyCount;
        if (this.flyCount > 10)
        {
            this.attackCount = 0;
        } // end if
        if (this.flyCount > 30)
        {
            this.state = "glide";
            this.flyCount = 0;
        } // end if
    }
    else if (this.state == "glide")
    {
        this._x = this._x + (random(this.speed) + this.speed * 2 + 5) * this.dir;
        this._y = this._y - ((this._y - _root.game.player._y + 65) / 16 + random(3));
        ++this.flyCount;
        if (this.flyCount > 30)
        {
            this.state = "fly";
            this.flyCount = 0;
        } // end if
    }
    else if (this.state == "die")
    {
        this._y = this._y + this.dy;
        ++this.dy;
        ++this.dieCount;
        if (this.dieCount > 200)
        {
            this._x = _root.game.player._x + 1000 * _root.playerDir;
            this._y = _root.game.player._y - 1000;
            this.health = 30;
            this.state = "glide";
            this.flyCount = 0;
            this.attackCount = 0;
            birdSfx = false;
        } // end else if
    } // end else if
    if (this._x < _root.game.player._x + 700 || this._x > _root.game.player._x - 700)
    {
        if (!birdSfx)
        {
            birdSfx = true;
            _root.eagle.start();
        } // end if
    } // end if
    if (_global.checkPlayer(this, this.dir, 40))
    {
        if (_root.playerAttacking && this.state != "hurt" && this.state != "die")
        {
            _root.kick.start();
            this.health = this.health - 10;
            if (this.health > 0)
            {
                this.state = "hurt";
                _root.kick.start();
            }
            else
            {
                this.state = "die";
                this.dieCount = 0;
                this.dy = 3;
                _root.score = _root.score + 100;
            } // end else if
        }
        else if (_root.playerState != "hurt" && this.state != "hurt" && this.state != "die")
        {
            if (this.attackCount == 0)
            {
                if (this.state == "fly")
                {
                    this.state = "attack";
                    this.flyCount = 0;
                } // end if
                _root.kick.start();
                _root.playerState = "hurt";
                _root.playerHealth = _root.playerHealth - 10;
                _root.playerInvincible = true;
            } // end if
            ++this.attackCount;
        } // end if
    } // end else if
    if (_global.checkBatarang(this))
    {
        if (this.state != "hurt" && this.state != "die")
        {
            this.health = this.health - 10;
            if (this.health > 0)
            {
                this.state = "hurt";
                _root.kick.start();
            }
            else
            {
                this.dieCount = 0;
                this.state = "die";
                this.dy = 3;
                _root.score = _root.score + 100;
            } // end if
        } // end if
    } // end else if
};
_global.respawn = function ()
{
    if (_root.eKills > 0 && _root.eKills % _root.enemies.length == 0)
    {
        for (i = 0; i < _root.enemies.length; i++)
        {
            if (_root.enemies[i]._name.substring(0, 4) == "goon")
            {
                _root.enemies[i].onEnterFrame = _global.goonAI;
                _root.enemies[i].speed = 9;
                _root.enemies[i].attackCount = 0;
            } // end if
            if (_root.enemies[i]._name.substring(0, 4) == "maid")
            {
                _root.enemies[i].onEnterFrame = _global.maidAI;
                _root.enemies[i].speed = 12;
                _root.enemies[i].whipped = true;
                _root.enemies[i].attackCount = 5;
            } // end if
            _root.enemies[i].state = "walk";
            _root.enemies[i].health = 80;
            _root.enemies[i].fallCount = 0;
            _root.enemies[i].flash = 0;
            _root.enemies[i]._visible = true;
            rand = random(10);
            if (rand > 4)
            {
                _root.enemies[i]._x = _root.game.player._x + 500 + random(600);
                _root.enemies[i].dir = -1;
                continue;
            } // end if
            _root.enemies[i]._x = _root.game.player._x - 500 - random(600);
            _root.enemies[i].dir = 1;
        } // end of for
        ++_root.respawned;
        _root.eKills = 0;
    } // end if
    if (_root.respawned > 3)
    {
        _root.camHeight = _root.camHeight + 4;
        _root.gotoNext = "level4b";
        _root.fadeout.play();
    } // end if
};
_global.respawn2 = function ()
{
    if (_root.respawned == 0 && _root.eKills > 0 && _root.eKills % _root.enemies.length == 0)
    {
        _root.overlay.gotoAndPlay("fight");
        for (i = 0; i < 8; i++)
        {
            _root.enemies[i].onEnterFrame = _global.goonAI;
            _root.enemies[i].state = "walk";
            _root.enemies[i].health = 50;
            _root.enemies[i].speed = 9;
            _root.enemies[i].dir = -1;
            _root.enemies[i].attackCount = 0;
            _root.enemies[i].fallCount = 0;
            _root.enemies[i].flash = 0;
            _root.enemies[i]._visible = true;
            rand = random(10);
            if (rand > 4)
            {
                _root.enemies[i]._x = _root.game.player._x + 500 + random(600);
                _root.enemies[i].dir = -1;
                continue;
            } // end if
            _root.enemies[i]._x = _root.game.player._x - 500 - random(600);
            _root.enemies[i].dir = 1;
        } // end of for
        _root.eKills = 0;
        ++_root.respawned;
    } // end if
    if (_root.respawned > 0 && _root.eKills == 8)
    {
        _root.camHeight = _root.camHeight + 15;
        _root.gotoNext = "card:bank";
        _root.fadeout.play();
    } // end if
};
_global.comboLogic = function ()
{
    if (_root.comboMeter)
    {
        this.gotoAndStop(_root.hitCount);
        targetx = _root.game.player._x - _root.playerDir * 70;
        targety = _root.game.player._y - 20;
        --_root.comboCount;
        if (_root.comboCount < 0)
        {
            this._alpha = this._alpha - 10;
            if (this._alpha < 0)
            {
                _root.comboMeter = false;
                _root.score = _root.score + _root.hitCount * 100;
                _root.hitCount = 0;
            } 
        }
        else if (this._alpha < 100)
        {
            this._alpha = this._alpha + (100 - this._alpha) / 4;
        } 
    }
    else
    {
        this._alpha = 0;
        targetx = _root.game.player._x + _root.playerDir * 70;
        targety = _root.game.player._y - 20;
    } 
    this._x = this._x + (targetx - this._x) * 1.800000E+000;
    this._y = this._y + (targety - this._y) * 1.800000E+000;
};
_global.itemLogic = function ()
{
    if (!this.collected)
    {
        if (this.hitTest(_root.game.player))
        {
            _root.coins = _root.coins + 1;
            _root.score = _root.score + 50;
            this.collected = true;
            _root.coin_flink.start();
            if (_root.coins >= 100)
            {
                ++_root.lives;
                _root.coins = 0;
                _root.score = _root.score + 5000;
                _root.bonus_sound.start();
                if (_root.lives > 4)
                {
                    _root.HUD.livesBar.gotoAndStop(5);
                }
                else
                {
                    _root.HUD.livesBar.gotoAndStop(_root.lives + 1);
                } // end if
            } // end if
        } // end else if
    }
    else if (this._visible)
    {
        this._visible = false;
        delete this.onEnterFrame;
    } // end else if
};
_global.lifeLogic = function ()
{
    if (!this.collected)
    {
        if (this.hitTest(_root.game.player))
        {
            _root.playerHealth = 100;
            _root.score = _root.score + 50;
            this.collected = true;
            _root.item.start();
        } // end if
    }
    else if (this._visible)
    {
        this._visible = false;
        delete this.onEnterFrame;
    } // end else if
};
_global.bgTouch = function ()
{
    if (!this.hit)
    {
        if (this.hitTest(_root.game.player))
        {
            this.play();
            this.hit = true;
            delete this.onEnterFrame;
        } // end if
    } // end if
};
_global.bgHit = function ()
{
    if (!this.hit)
    {
        if (this.hitTest(_root.game.player) && _root.playerAttacking)
        {
            _root.metal1.start();
            this.play();
            this.hit = true;
            delete this.onEnterFrame;
        } // end if
    } // end if
};
_global.bgLight = function ()
{
    if (!this.hit)
    {
        if (this.hitTest(_root.game.player) && _root.playerAttacking)
        {
            _root.metal1.start();
            this.hit = true;
            this.dy = 4;
        } // end if
    }
    else if (this._y < -50)
    {
        this._y = this._y + this.dy;
        this.dy = this.dy + 1;
    }
    else
    {
        this.play();
        delete this.onEnterFrame;
    } // end else if
};
_global.bgCage = function ()
{
    if (!this.hit)
    {
        if (this.hitTest(_root.game.player) && _root.playerAttacking)
        {
            _root.metal1.start();
            this.hit = true;
            this.dy = 14;
        } // end if
    }
    else if (this._y < 170)
    {
        this._y = this._y + this.dy;
        this.dy = this.dy + 2;
    }
    else
    {
        this.play();
        delete this.onEnterFrame;
    } // end else if
};
_global.clockTimer = function ()
{
    if (!this.startTimer && _root.playerState != "die")
    {
        this.startTimer = getTimer();
        this.lastTimer = getTimer();
        this.secs = 90;
        this.millisecs = 99;
    } // end if
    if (this.secs > 0)
    {
        this.curTimer = getTimer();
        if (this.curTimer - this.lastTimer > 1000)
        {
            this.lastTimer = this.curTimer;
            --this.secs;
        } // end if
        this.millisecs = this.curTimer % 100;
        if (this.secs > 9)
        {
            this.display.text = [this.secs + " :" + this.millisecs];
        }
        else
        {
            this.display.text = ["0" + this.secs + " :" + this.millisecs];
        } // end else if
    }
    else if (!this.exploded)
    {
        this.exploded = true;
        this.display.text = "00 :00";
        _root.playerHealth = 0;
        _root.playerState = "die";
        _root.explode.start();
        _root.game.halo.gotoAndPlay("fire");
        this.startTimer = false;
        delete this.onEnterFrame;
    } // end else if
};
_global.pitLogic = function ()
{
    if (this.hitTest(_root.game.player))
    {
        if (!done)
        {
            done = true;
            if (_root.lives > 0)
            {
                --_root.lives;
                _root.gotoNext = "continue";
            }
            else
            {
                _root.gotoNext = "gameover";
                _root.gotoLast = "start";
            } // end else if
            _root.fadeout.play();
        } // end if
    }
    else
    {
        done = false;
    } // end else if
};
_global.lavaLogic = function ()
{
    if (this.hitTest(_root.game.player))
    {
        if (!this.done)
        {
            _root.punch2.start();
            _root.playerState = "hurt";
            _root.playerHealth = _root.playerHealth - 10;
            _root.playerInvincible = true;
            this.done = true;
        } // end if
    }
    else
    {
        this.done = false;
    } // end else if
};
_global.highwayLogic = function ()
{
    if (this.hitTest(_root.game.player))
    {
        if (!done)
        {
            done = true;
            if (_root.lives < 0)
            {
                _root.gotoNext = "gameover";
                _root.gotoLast = "start";
            }
            else
            {
                --_root.lives;
                _root.gotoNext = "continue";
            } // end else if
            _root.fadeout.play();
        } // end if
        _root.playerHealth = -1;
        _root.playerState = "die";
        _root.game.player._x = _root.game.player._x + 18;
    }
    else
    {
        done = false;
    } // end else if
};
_global.elevatorLogic = function ()
{
    if (!_root.onPlatform)
    {
        if (this.hitBox.hitTest(_root.game.player) && _root.playerDy >= 0)
        {
            if (this._y != this.limit)
            {
                this.moving = true;
            } // end if
            if (this._y < this.limit)
            {
                this.dy = 12;
            }
            else
            {
                _root.game.player._y = _root.game.player._y - 32;
                this.dy = -12;
            } // end else if
            _root.currentPlatform = this;
            _root.onPlatform = true;
        } // end if
    }
    else if (_root.currentPlatform == this)
    {
        if (this.hitBox.hitTest(_root.game.player))
        {
            _root.onPlatform = true;
            if (!_root.playerJumping)
            {
                _root.playerDy = this.dy;
                _root.gravity = 0;
                if (this.dy > 0)
                {
                    _root.game.player._y = _root.game.player._y - (_root.game.player._y - this._y + _root.playerHeight + 20);
                }
                else
                {
                    _root.game.player._y = _root.game.player._y - (_root.game.player._y - this._y + _root.playerHeight + 40);
                } // end else if
            }
            else
            {
                _root.onPlatform = false;
                _root.currentPlatform = 0;
                _root.playerDy = -36 + this.dy / 3;
                _root.gravity = _root.globalGravity;
            } // end else if
        }
        else if (_root.currentPlatform == this)
        {
            if (Math.abs(_root.game.player._y - this._y) > 160)
            {
                _root.onPlatform = false;
            }
            else if (_root.playerJumping)
            {
                _root.onPlatform = false;
            } // end else if
        } // end else if
        if (this.dy > 0)
        {
            if (this._y >= this.limit)
            {
                this.dy = 0;
                _root.onPlatform = false;
                _root.currentPlatform = 0;
                _root.playerDy = 0;
                _root.gravity = _root.globalGravity;
                this._y = this.limit;
                delete this.onEnterFrame;
            } // end if
        }
        else if (this.dy < 0)
        {
            if (this._y <= this.limit)
            {
                this.dy = 0;
                _root.onPlatform = false;
                _root.currentPlatform = 0;
                _root.playerDy = 0;
                _root.gravity = _root.globalGravity;
                this._y = this.limit;
                delete this.onEnterFrame;
            } // end if
        } // end else if
    } // end else if
    if (this.dy < 0 && this._y > this.limit || this.dy > 0 && this._y < this.limit)
    {
        this._y = this._y + this.dy;
    } // end if
};
_global.liftLogic = function ()
{
    this.distx = Math.abs(this._x - _root.game.player._x);
    if (this._currentFrame <= 50)
    {
        this.dy = -6;
    }
    else
    {
        this.dy = 6;
    } // end else if
    if (!_root.onPlatform)
    {
        if (this.hitBox.hitTest(_root.game.player) && this.distx < 300)
        {
            if (this.hitBox2.hitTest(_root.game.player))
            {
                _root.currentPlatform = this;
                _root.onPlatform = true;
                _root.playerDy = this.dy;
                _root.gravity = 0;
            } // end if
        } // end if
    }
    else if (_root.currentPlatform == this)
    {
        if (this.hitBox.hitTest(_root.game.player))
        {
            if (!_root.playerJumping)
            {
                _root.game.player._y = _root.game.player._y - 6;
                _root.gravity = 0;
                _root.playerDy = this.dy;
                _root.onPlatform = true;
            }
            else
            {
                _root.onPlatform = false;
                _root.currentPlatform = 0;
                _root.playerDy = -36;
                _root.gravity = _root.globalGravity;
            } // end else if
            if (this.distx > 300)
            {
                _root.playerDy = 7;
                _root.onPlatform = false;
                _root.gravity = _root.globalGravity;
                _root.currentPlatform = 0;
            } // end if
        }
        else if (this.distx < 300 && !_root.playerJumping)
        {
            if (this.hitBox2.hitTest(_root.game.player))
            {
                _root.onPlatform = true;
                _root.playerDy = this.dy;
                if (this.hitBox3.hitTest(_root.game.player))
                {
                    _root.game.player._y = _root.game.player._y + 3;
                } // end if
            } // end if
        }
        else
        {
            if (!_root.playerJumping)
            {
                _root.playerDy = 7;
            } // end if
            _root.onPlatform = false;
            _root.gravity = _root.globalGravity;
            _root.currentPlatform = 0;
        } // end else if
    } // end else if
};
_global.beltLogic = function ()
{
    if (this.hitTest(_root.game.player))
    {
        _root.game.player._x = _root.game.player._x + this.dx;
    } // end if
};
_global.stompLogic = function ()
{
    if (this.hitTest(_root.game.player) && this._currentframe < 30)
    {
        if (!this.done)
        {
            _root.punch2.start();
            _root.playerState = "hurt";
            _root.playerHealth = _root.playerHealth - 10;
            _root.playerInvincible = true;
            this.done = true;
        } // end if
    }
    else
    {
        this.done = false;
    } // end else if
};
_global.doorOpen = function ()
{
    if (this.hitTest(_root.game.player))
    {
        if (this.door._currentframe == 1)
        {
            this.door.gotoAndPlay("open");
        } // end if
    }
    else if (this.door._currentframe == 10)
    {
        this.door.gotoAndPlay("close");
    } // end else if
};
function randRange(min, max)
{
    var _loc1 = Math.round(Math.random() * (max - min)) + min;
    return (_loc1);
} // End of the function
function randRange(min, max)
{
    var _loc1 = Math.round(Math.random() * (max - min)) + min;
    return (_loc1);
} // End of the function
_root.snowing = false;
var snowCount = 100;
var speed = 2;
_global.snowStart = function ()
{
    var _loc4 = new Array();
    var _loc8 = 5;
    var _loc6 = 5;
    var _loc5 = 1;
    var _loc7 = new flash.filters.BlurFilter(_loc8, _loc6, _loc5);
    _loc4.push(_loc7);
    if (!_root.snowing)
    {
        _root.snowing = true;
        for (var _loc3 = 0; _loc3 < snowCount; ++_loc3)
        {
            _root.snow.duplicateMovieClip("snow" + _loc3, _root.getNextHighestDepth() + _loc3);
            _root["snow" + _loc3]._x = randRange(0, 600);
            _root["snow" + _loc3]._y = randRange(0, 410);
            if (_loc3 % 2 == 0)
            {
                _root["snow" + _loc3].movingRight = -1;
                _root["snow" + _loc3].moveCount = 10;
            }
            else
            {
                _root["snow" + _loc3].movingRight = 1;
                _root["snow" + _loc3].moveCount = 0;
            } // end else if
            _root["snow" + _loc3].cacheAsBitmap = true;
            _root["snow" + _loc3].onEnterFrame = function ()
            {
                this._y = this._y + (speed + Math.random());
                if (_root.cameraMoving)
                {
                    this._x = this._x - _root.playerDx * 8.000000E-001;
                } // end if
                if (_root.playerJumping)
                {
                    this._y = this._y - _root.playerDy / 2;
                } // end if
                if (this.movingRight == 1)
                {
                    this._x = this._x + (speed + Math.random());
                    this.moveCount = this.moveCount + Math.random();
                    if (this.moveCount > 10)
                    {
                        this.movingRight = -1;
                    } // end if
                }
                else
                {
                    this._x = this._x - (speed + Math.random());
                    this.moveCount = this.moveCount - Math.random();
                    if (this.moveCount < 0)
                    {
                        this.movingRight = 1;
                    } // end if
                } // end else if
                if (this._y > 410)
                {
                    this._y = randRange(0, 20);
                } // end if
                if (this._x > 650)
                {
                    this._x = -50;
                }
                else if (this._x < -50)
                {
                    this._x = 650;
                } // end else if
            };
        } // end of for
    } // end if
};
_global.snowStop = function ()
{
    if (_root.snowing)
    {
        for (var _loc2 = 0; _loc2 < snowCount; ++_loc2)
        {
            removeMovieClip (_root["snow" + _loc2]);
        } // end of for
        _root.snowing = false;
    } // end if
};
_root.dropCount = 50;
_root.raining = false;
_root.movingRight = true;
_root.rainSpeed = 15;
_global.rainStart = function ()
{
    var _loc5 = new Array();
    var _loc8 = 2;
    var _loc6 = 2;
    var _loc4 = 1;
    var _loc9 = 75;
    var _loc7 = new flash.filters.BlurFilter(_loc8, _loc6, _loc4);
    _loc5.push(_loc7);
    if (!_root.raining)
    {
        _root.raining = true;
        for (var _loc3 = 0; _loc3 < _root.dropCount; ++_loc3)
        {
            _root.drop.duplicateMovieClip("rain" + _loc3, _root.getNextHighestDepth());
            _root["rain" + _loc3]._x = randRange(0, 590);
            _root["rain" + _loc3]._y = randRange(0, 400);
            _root["rain" + _loc3]._xscale = _root["rain" + _loc3]._xscale * -1;
            _root["rain" + _loc3].onEnterFrame = function ()
            {
                this._y = this._y + (_root.rainSpeed + Math.random());
                if (_root.movingRight)
                {
                    this._x = this._x - (_root.rainSpeed + Math.random());
                }
                else
                {
                    this._x = this._x + (_root.rainSpeed + Math.random());
                } // end else if
                if (_root.cameraMoving)
                {
                    this._x = this._x - _root.playerDx * 8.000000E-001;
                } // end if
                if (_root.playerJumping)
                {
                    this._y = this._y - _root.playerDy / 2;
                } // end if
                if (this._y > 400)
                {
                    this._y = Math.random() * 8;
                } // end if
                if (this._x < 0)
                {
                    this._x = 600 + Math.random() * 8;
                }
                else if (this._x > 610)
                {
                    this._x = Math.random() * 8;
                } // end else if
            };
        } // end of for
    } // end if
};
_global.rainStop = function ()
{
    if (_root.raining)
    {
        for (var _loc2 = 0; _loc2 < _root.dropCount; ++_loc2)
        {
            removeMovieClip (_root["rain" + _loc2]);
        } // end of for
        _root.raining = false;
    } // end if
    _root.rainfall.stop();
};
var windSpeed = 1;
var puffCount = 100;
var foggy = false;
var fogQuality = 1;
var fogFilters1 = new Array();
var blur1 = 31;
var fogBlur1 = new flash.filters.BlurFilter(blur1, blur1, fogQuality);
fogFilters1.push(fogBlur1);
var fogFilters2 = new Array();
var blur2 = 32;
var fogBlur2 = new flash.filters.BlurFilter(blur2, blur2, fogQuality);
fogFilters2.push(fogBlur2);
var blur3 = 19;
var fogFilters3 = new Array();
var fogBlur3 = new flash.filters.BlurFilter(blur3, blur3, fogQuality);
fogFilters3.push(fogBlur3);
var fog_alpha = 30;
_global.startFog = function ()
{
};
_global.stopFog = function ()
{
    if (_root.foggy)
    {
        for (var _loc2 = 0; _loc2 <= puffCount + 3; ++_loc2)
        {
            removeMovieClip (_root["fog" + _loc2]);
        } // end of for
        _root.foggy = false;
    } // end if
    _root.windSound.stop("windy");
};
