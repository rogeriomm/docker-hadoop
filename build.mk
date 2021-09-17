Prj([ Docker(name="hue"),
      Docker(name="base",            prefix="hadoop"),
      Docker(name="namenode",        prefix="hadoop"),
      Docker(name="datanode",        prefix="hadoop"),
      Docker(name="resourcemanager", prefix="hadoop"),
      Docker(name="historyserver",   prefix="hadoop"),
      Docker(name="submit",          prefix="hadoop"),
      Docker(name="nodemanager",     prefix="hadoop")
      ], "docker-hadoop")

