function init()
  a = config.getParameter("effects",{})
  a = type(a) == "string" and {a} or a
  b = config.getParameter("itemName")
  useTime = config.getParameter("useTime",0.15)
  activeItem.setArmAngle(-math.pi / 2)
end

function update(dt,fireMode)
  if not useTimer and fireMode == "primary" and player then
    useTimer = useTime
  end

  if useTimer then
    useTimer = math.max(0, useTimer - dt)

    activeItem.setArmAngle((-math.pi / 2) * (useTimer / useTime))

    if useTimer == 0 then
--      activeItem.setArmAngle(0)
      animator.playSound("stimuse")
      status.addPersistentEffects(b,a)
      activeItem.setArmAngle(-math.pi / 2)
      item.consume(1)
    end
  end
end

function updateAim()
  _, aimDirection = activeItem.aimAngleAndDirection(0, activeItem.ownerAimPosition())
  activeItem.setFacingDirection(aimDirection)
end