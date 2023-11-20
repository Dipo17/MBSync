<h1>Marker Script Documentation</h1> <h2>Introduction</h2> <p> This script is used to manage markers in your FiveM server. It allows you to add and remove markers easily. The script provides various customization options for the markers such as position, rotation, scale, color, animation, and interaction functionality. The script also supports the use of textures for the markers. </p> <h2>Usage</h2> <p> To use this script, you need to have the <code>mbsync</code> resource installed and running on your FiveM server. Once the resource is set up, you can create markers using the provided functions. Here is an example usage of the script: </p> <pre> RegisterNetEvent("mbsync.addMarker", function(data) -- Marker creation code here end)
Citizen.CreateThread(function()
  TriggerEvent("mbsync.addMarker", {
    name = "marker_example",
    coords = vec3(-75.47181, -819.3127, 326.1755),
    scale = vec3(0.5,0.5,0.5),
    drawDistance = 4,
    interactDistance = 1,
    rotation = vec3(90.0,0.0,0.0),
    rotate = true,
    rebound = true,
    facecamera = true,
    type = 9,
    useTexture = true,
    textureName = 'donut',
    message = 'Press ~INPUT_CONTEXT~ to interact',
    onPress = function(self)
      -- Marker onPress code here
    end
  })
end)
</pre> <h2>Functions</h2> <h3><code>TriggerEvent("mbsync.addMarker", data)</code></h3> <p> This event is used to add a marker to the server. It takes a table of data as a parameter, which contains the configuration options for the marker. The following properties can be used in the data table: </p> <table> <tr> <th>Property</th> <th>Type</th> <th>Description</th> </tr> <tr> <td>name</td> <td>string</td> <td>The name or identifier of the marker. It should be unique.</td> </tr> <tr> <td>coords</td> <td>vec3</td> <td>The position of the marker in the world.</td> </tr> <tr> <td>scale</td> <td>vec3</td> <td>The scale of the marker in x, y, and z directions.</td> </tr> <tr> <td>drawDistance</td> <td>number</td> <td>The maximum distance at which the marker will be visible.</td> </tr> <tr> <td>interactDistance</td> <td>number</td> <td>The distance at which the user can interact with the marker.</td> </tr> <tr> <td>rotation</td> <td>vec3 (optional)</td> <td>The rotation of the marker in x, y, and z directions. Default is 0.0, 0.0, 0.0.</td> </tr> <tr> <td>rotate</td> <td>boolean (optional)</td> <td>Whether the marker should rotate. Default is false.</td> </tr> <tr> <td>rebound</td> <td>boolean (optional)</td> <td>Whether the marker should have a rebound animation. Default is false.</td> </tr> <tr> <td>facecamera</td> <td>boolean (optional)</td> <td>Whether the marker should always face the player camera. Default is false.</td> </tr> <tr> <td>type</td> <td>number</td> <td>The type of the marker. See the FiveM documentation for available types.</td> </tr> <tr> <td>useTexture</td> <td>boolean (optional)</td> <td>Whether the marker should use a custom texture. Default is false.</td> </tr> <tr> <td>textureName</td> <td>string (optional)</td> <td>The name of the texture to use for the marker. Only applicable if useTexture is true.</td> </tr> <tr> <td>message</td> <td>string (optional)</td> <td>The message to display when the user interacts with the marker.</td> </tr> <tr> <td>onPress</td> <td>function (optional)</td> <td>A function that will be executed when the user presses the specified key for the marker.</td> </tr> </table> <h3><code>TriggerEvent("mbsync.removeMarker", index)</code></h3> <p> This event is used to remove a marker from the server. It takes the name or index of the marker as a parameter. </p> <h2>Conclusion</h2> <p> This documentation provides an overview of the marker script and its usage. You can create and customize markers easily using the provided functions. For more advanced usage and customization options, please refer to the script's source code and the FiveM documentation. </p> </body> </html>
