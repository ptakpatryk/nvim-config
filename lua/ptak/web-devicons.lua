local status_ok, web_icons = pcall(require, "nvim-web-devicons")
if not status_ok then
  return
end

web_icons.set_icon(
  {
    ["jsx"] = {
      icon = "",
      color = "#20c2e3",
      name = "Jsx",
    },
  }
)

web_icons.set_icon(
  {
    ["test.jsx"] = {
      icon = "ﭧ",
      color = "#20c2e3",
      name = "JavaScriptTest"
    },
  }
)

web_icons.set_icon(
  {
    ["tsx"] = {
      icon = "",
      color = "#1354bf",
      name = "Tsx",
    },
  }
)

web_icons.set_icon(
  {
    ["test.tsx"] = {
      icon = "ﭧ",
      color = "#1354bf",
      name = "TypeScriptTest"
    },
  }
)
