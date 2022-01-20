function init()
    a = config.getParameter("effects",{})
    a = type(a) == "string" and {a} or a
    b = config.getParameter("itemName")
  end
  
  function activate() status.addPersistentEffects(b,a) end