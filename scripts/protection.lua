function init()
  stats = config.getParameter("stats")
  if stats then
    local a = {}
    for i = 1, #stats do
      a[i] = {stat=stats[i],amount=1}
    end
    effect.addStatModifierGroup(a)
   end
   script.setUpdateDelta(0)
end